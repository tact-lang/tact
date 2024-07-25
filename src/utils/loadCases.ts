import fs from "fs";

/**
 * @param src Path to the directory with files
 * @param ext Optional extension of the file, without the dot prefix
 */
export function loadCases(src: string, ext?: string) {
    const recs = fs.readdirSync(src);
    const res: { name: string; code: string }[] = [];
    const extWithDot = `.${ext ? ext.toLowerCase() : "tact"}`;

    for (const r of recs) {
        if (r.endsWith(extWithDot)) {
            res.push({
                name: r.slice(0, r.length - extWithDot.length),
                code: fs.readFileSync(src + r, "utf8"),
            });
        }
    }
    res.sort((a, b) => a.name.localeCompare(b.name));
    return res;
}
