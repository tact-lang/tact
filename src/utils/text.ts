export function isBlank(src: string): boolean {
    return src.trim().length === 0;
}

export function indentWidth(src: string): number {
    return src.length - src.trimStart().length;
}

export function trimIndent(src: string): string {
    // Parse lines
    let lines = src.split("\n");
    if (lines.length === 0) {
        return "";
    }
    if (lines.length === 1) {
        return lines[0]!.trim();
    }

    // Remove first and last empty line
    if (isBlank(lines[0]!)) {
        lines = lines.slice(1);
    }
    if (isBlank(lines[lines.length - 1]!)) {
        lines = lines.slice(0, lines.length - 1);
    }
    if (lines.length === 0) {
        return "";
    }

    // Find minimal indent
    const indents = lines.filter((v) => !isBlank(v)).map((v) => indentWidth(v));
    const minimal = indents.length > 0 ? Math.min(...indents) : 0;

    // Trim indent
    return lines.map((v) => (isBlank(v) ? "" : v.slice(minimal))).join("\n");
}
