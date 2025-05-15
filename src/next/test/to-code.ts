function isValidId(key: string) {
    return /^[A-Za-z_$][A-Za-z0-9_$]*$/.test(key);
}

const pad = (s: readonly string[]) => s.map(s => "  " + s);

function concat(s: readonly string[], t: readonly string[]): readonly string[] {
    const [last, ...init] = [...s].reverse();
    const [head, ...tail] = t;
    if (typeof last === 'undefined') {
        return t;
    } else if (typeof head === 'undefined') {
        return s;
    } else {
        return [...init.reverse(), last + head, ...tail];
    }
}

function concatAll(s: readonly (readonly string[])[]): readonly string[] {
    return s.reduce((acc, next) => concat(acc, next), []);
}

const braced = (l: string, code: readonly string[], r: string) => {
    const m = pad(code);
    return m.length === 0 ? [l + r] : [l, ...m, r];
};

export function toJs(value: unknown): string {
    const counts: Map<unknown, 'exists' | { name: string }> = new Map();
    const order: Map<string, readonly string[]> = new Map();
    let nextId = 0;
    function countUsages(val: unknown) {
        if (typeof val !== 'object' || val === null || val instanceof Date || val instanceof RegExp) {
            return;
        }
        const newCount = counts.get(val);
        if (!newCount) {
            counts.set(val, 'exists');
            const items = 
                Array.isArray(val) ? val :
                val instanceof Map ? val.entries().flatMap((kv) => kv) :
                val instanceof Set ? [...val] :
                Object.entries(val)
            
            for (const item of items) {
                countUsages(item);
            }
        } else if (newCount === 'exists') {
            const name = `x${++nextId}`;
            counts.set(val, { name });
        }
    }

    function show(val: unknown): readonly string[] {
        const count = counts.get(val);
        if (typeof count !== 'object') {
            return showAny(val);
        }
        if (!order.has(count.name)) {
            // set as being prepared
            order.set(count.name, []);
            const res = showAny(val);
            order.set(count.name, res);
        }
        return [count.name];
    }

    function showAny(val: unknown): readonly string[] {
        switch (typeof val) {
            case "string": return [JSON.stringify(val)];
            case "number": return [String(val)];
            case "boolean": return [String(val)];
            case "bigint": return [val.toString() + 'n'];
            case "symbol": return [val.description ? `Symbol(${JSON.stringify(val.description)})` : 'Symbol()'];
            case "undefined": return ['undefined'];
            case "object": return val === null ? ["null"] : showObject(val);
            case "function": return [`new Function(${val.toString()})`];
        }
    }

    const showObject = (val: object): readonly string[] => {
        if (val instanceof Date) {
            return [`new Date(${val.getTime()})`];
        }
        if (val instanceof RegExp) {
            return [val.toString()]; // sus
        }
        if (Array.isArray(val)) {
            return braced(
                '[',
                val.flatMap((item) => {
                    return concat(show(item), [","]);
                }),
                ']',
            );
        }
        if (val instanceof Map) {
            return braced(
                'new Map([',
                [...val.entries()].flatMap(([k, v]) => {
                    return concatAll([["["], show(k), [", "], show(v), ["],"]]);
                }),
                '])',
            );
        }
        if (val instanceof Set) {
            return braced(
                'new Set([',
                [...val].flatMap((k) => {
                    return concat(show(k), [","]);
                }),
                '])',
            );
        }
        return braced(
            '{',
            Object.entries(val).flatMap(([k, v]) => {
                const keyRep = isValidId(k) ? k : JSON.stringify(k);
                return concatAll([[keyRep], [": "], show(v), [","]]);
            }),
            '}',
        );
    };

    countUsages(value);
    const res = show(value);

    const code = [...order.entries()].flatMap(([varName, code]) => {
        return concatAll([
            [`const ${varName} = `],
            code,
            [";"],
        ]);
    }).join('\n');

    return `${code ? `${code}\n\n` : ''}export default ${res.join('\n')};\n`;
}
