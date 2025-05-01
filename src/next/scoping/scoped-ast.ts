export type ScopeId = string;

export type Constraint =
    | Define
    | Use
    | Child

export type Define = {
    readonly kind: 'define';
    readonly name: string;
    readonly scope: ScopeId;
}

export type Use = {
    readonly kind: 'use';
    readonly name: string;
    readonly scope: ScopeId;
}

type Name = string
export type Scope = StmtScope

type StmtScope = {
    readonly kind: 'stmt_scope';
    readonly parent: Scope | undefined;
    readonly vars: Map<Name, {
        // usedBy: Set<Id>;
        definedBy: Set<Id>;
    }>;
    readonly types: Map<Name, ...>;
    readonly functions: Map<Name, ...>;
}

fun f(y: Int) {
    let x = y + 1;
    {
        let z = 0;
    }
    let z = 0;
    return x + z;
}

ensureMap(s.vars, "y", def)

getVar(s, "y").definedBy.add(f)

for (const s of scopes) {
    for (const [k, { usedBy, definedBy }] of s.vars) {
        if (definedBy.size === 0) {
            for (const usage of usedBy) {
                error(`Variable ${k} was not defined`, usage.loc);
            }
        } else if (definedBy.size > 1) {
            const [head, ...tail] = definedBy;
            for (const def of tail) {
                error(`Variable ${k} is already defined`, def.loc);
            }
        } else {

        }
    }
}

const ensureMap = <K, V>(m: Map<K, V>, k: K, v: V): V => {
    const prev = m.get(k);
    if (prev) {
        return prev;
    } else {
        const x = {...v};
        m.set(k, x);
        return x;
    }
};
