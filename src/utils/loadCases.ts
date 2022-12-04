import fs from 'fs';

export function loadCases(src: string) {
    let recs = fs.readdirSync(src);
    let res: { name: string, code: string }[] = [];
    for (let r of recs) {
        if (r.endsWith('.tact')) {
            res.push({ name: r.slice(0, r.length - '.tact'.length), code: fs.readFileSync(src + r, 'utf8') });
        }
    }
    res.sort((a, b) => a.name.localeCompare(b.name));
    return res;
}