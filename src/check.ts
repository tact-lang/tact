import { featureEnable } from "./config/features";
import { CompilerContext } from "./context";
import { getAstFactory } from "./grammar/ast";
import { getParser } from "./grammar";
import files from "./imports/stdlib";
import { createVirtualFileSystem, TactError, VirtualFileSystem } from "./main";
import { precompile } from "./pipeline/precompile";
import { defaultParser } from "./grammar/grammar";

export type CheckResultItem = {
    type: "error" | "warning";
    message: string;
    location?: {
        file: string;
        line: number;
        column: number;
        length: number;
    };
};

export type CheckResult =
    | {
          ok: true;
      }
    | {
          ok: false;
          messages: CheckResultItem[];
      };

export function check(args: {
    project: VirtualFileSystem;
    entrypoint: string;
}): CheckResult {
    // Create context
    const stdlib = createVirtualFileSystem("@stdlib/", files);
    let ctx: CompilerContext = new CompilerContext();
    ctx = featureEnable(ctx, "debug"); // Enable debug flag (does not affect type checking in practice)
    ctx = featureEnable(ctx, "external"); // Enable external messages flag to avoid external-specific errors

    const ast = getAstFactory();
    const parser = getParser(ast, defaultParser);

    // Execute check
    const items: CheckResultItem[] = [];
    try {
        precompile(ctx, args.project, stdlib, args.entrypoint, parser, ast);
    } catch (e) {
        if (e instanceof TactError) {
            items.push({
                type: "error",
                message: e.message,
                location:
                    e.loc === undefined
                        ? undefined
                        : e.loc.file
                          ? {
                                file: e.loc.file,
                                line: e.loc.interval.getLineAndColumn().lineNum,
                                column: e.loc.interval.getLineAndColumn()
                                    .colNum,
                                length:
                                    e.loc.interval.endIdx -
                                    e.loc.interval.startIdx,
                            }
                          : {
                                file: args.entrypoint,
                                line: 0,
                                column: 0,
                                length: 0,
                            },
            });
        } else {
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            const msg = (e as any).message;
            if (typeof msg === "string") {
                items.push({
                    type: "error",
                    message: msg,
                    location: {
                        file: args.entrypoint,
                        line: 0,
                        column: 0,
                        length: 0,
                    },
                });
            } else {
                items.push({
                    type: "error",
                    message: "Unknown internal message",
                    location: {
                        file: args.entrypoint,
                        line: 0,
                        column: 0,
                        length: 0,
                    },
                });
            }
        }
    }

    if (items.length > 0) {
        return {
            ok: false,
            messages: items,
        };
    }
    return {
        ok: true,
    };
}
