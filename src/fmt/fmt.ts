import type { Cst } from "@/fmt/cst/cst-parser";
import { format } from "@/fmt/formatter/formatter";
import { parseCode, visit } from "@/fmt/cst/cst-helpers";
import { getParser } from "@/grammar";
import { getAstFactory } from "@/ast/ast-helpers";
import { TactCompilationError } from "@/error/errors";

interface FormatCodeError {
    $: "FormatCodeError";
    message: string;
}

interface FormattedCode {
    $: "FormattedCode";
    code: string;
}

export function formatCode(
    path: string,
    code: string,
): FormattedCode | FormatCodeError {
    const root = parseCode(code);
    if (!root) {
        return getCannotParseCodeError(code, path);
    }
    const formatted = format(root);
    return checkFormatting(root, code, formatted);
}

function getCannotParseCodeError(code: string, path: string): FormatCodeError {
    const parser = getParser(getAstFactory());
    try {
        parser.parse({
            code,
            origin: "user",
            path: path,
        });
    } catch (e) {
        if (e instanceof TactCompilationError) {
            return {
                $: "FormatCodeError",
                message: e.message,
            };
        }
    }

    return {
        $: "FormatCodeError",
        message: "cannot parse code",
    };
}

function checkFormatting(
    root: Cst,
    before: string,
    after: string,
): FormattedCode | FormatCodeError {
    if (before === after) {
        return {
            $: "FormattedCode",
            code: before,
        };
    }

    const rootAfter = parseCode(after);
    if (!rootAfter) {
        return {
            $: "FormatCodeError",
            message: "cannot parse code after formatting",
        };
    }

    const commentsBefore = new Set(collectComments(root));
    const commentsAfter = new Set(collectComments(rootAfter));

    if (!areSetsEqual(commentsBefore, commentsAfter)) {
        const missedComments = [
            ...missingElements(commentsBefore, commentsAfter),
        ];
        return {
            $: "FormatCodeError",
            message: `missed comments after formatting: ${missedComments.toString()}`,
        };
    }

    return {
        $: "FormattedCode",
        code: after,
    };
}

const collectComments = (node: Cst): string[] => {
    if (node.$ === "leaf") return [];
    if (node.type === "Comment") return [visit(node).trim()];
    return node.children.flatMap((it) => collectComments(it));
};

function areSetsEqual(setA: Set<string>, setB: Set<string>): boolean {
    if (setA.size !== setB.size) return false;
    for (const item of setA) {
        if (!setB.has(item)) return false;
    }
    return true;
}

function missingElements(setA: Set<string>, setB: Set<string>): Set<string> {
    return new Set([...setA].filter((item) => !setB.has(item)));
}
