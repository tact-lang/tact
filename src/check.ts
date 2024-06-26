import { featureEnable } from "./config/features";
import { CompilerContext } from "./context";
import files from "./imports/stdlib";
import { createVirtualFileSystem, TactError, VirtualFileSystem } from "./main";
import { precompile } from "./pipeline/precompile";

export type CheckResultItem = {
    type: "error" | "warning";
    message: string;
    location: {
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
    let ctx: CompilerContext = new CompilerContext({ shared: {} });
    ctx = featureEnable(ctx, "debug"); // Enable debug flag (does not affect type checking in practice)
    ctx = featureEnable(ctx, "masterchain"); // Enable masterchain flag to avoid masterchain-specific errors
    ctx = featureEnable(ctx, "external"); // Enable external messages flag to avoid external-specific errors

    // Execute check
    const items: CheckResultItem[] = [];
    try {
        precompile(ctx, args.project, stdlib, args.entrypoint);
    } catch (e) {
        if (e instanceof TactError) {
            items.push({
                type: "error",
                message: e.message,
                location: e.ref.file
                    ? {
                          file: e.ref.file,
                          line: e.ref.interval.getLineAndColumn().lineNum,
                          column: e.ref.interval.getLineAndColumn().colNum,
                          length:
                              e.ref.interval.endIdx - e.ref.interval.startIdx,
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
