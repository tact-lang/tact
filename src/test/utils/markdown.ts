const aligns = { left: ["padEnd", " "], right: ["padStart", ":"] } as const;

export type Align = keyof typeof aligns;

interface Table<L extends string, M> {
    end: (t: Record<L, M>[]) => M;
    add: <K extends string>(
        field: K,
        title: M,
        align: Align,
    ) => Table<K | L, M>;
}

const build = <L extends string>(
    display: (rows: Record<L, string>[]) => [string, string, string[]],
): Table<L, string> => ({
    end: (t: Record<L, string>[]) => display(t).flat().join("\n") + "\n",
    add: <K extends string>(
        field: K,
        title: string,
        align: keyof typeof aligns,
    ) =>
        build<L | K>((table) => {
            const column = table.map((row) => row[field]);
            const width = column.reduce(
                (acc, cell) => Math.max(acc, cell.length),
                title.length,
            );
            const [pad, char] = aligns[align];
            const [header, sep, body] = display(table);
            return [
                `${header} ${title[pad](width)} |`,
                `${sep} ${"-".repeat(width)}${char}|`,
                column.flatMap((cell, i) =>
                    body[i] ? [`${body[i]} ${cell[pad](width)} |`] : [],
                ),
            ];
        }),
});

const table = build<never>((rows) => ["|", "|", rows.map(() => "|")]);

const text = (s: string) => s.replace(/([\\*|_])/g, (x) => `\\${x}`);

const subst = (s: TemplateStringsArray) => text(s.join(""));

const section = (title: string, body: string) => `## ${title}\n${body}`;

const pre = (s: string) => {
    const maxLen = [...s.matchAll(/(`+)/g)]
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        .reduce((acc, [_, m]) => Math.max(acc, m?.length ?? 0), 0);
    const quote = "`".repeat(1 + maxLen);
    return `${quote}${s}${quote}`;
};

export interface Markdown<M> {
    table: Table<never, M>;
    text: (s: string) => M;
    t: (s: TemplateStringsArray) => M;
    section: (title: M, body: M) => M;
    pre: (text: M) => M;
}

export type GetRow<T> = T extends (x: (infer R)[]) => infer _ ? R : never;

export const md: Markdown<string> = {
    table,
    text,
    t: subst,
    section,
    pre,
};
