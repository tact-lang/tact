import * as Ast from "@/next/ast";

export const emptyEff: Ast.Effects = Object.freeze({
    returnOrThrow: false,
    setSelfPaths: new Set<string>(),
});

// when two branches merge
export const mergeEff = (
    left: Ast.Effects,
    right: Ast.Effects,
): Ast.Effects => {
    return Ast.Effects(
        left.returnOrThrow && right.returnOrThrow,
        new Set(
            [...left.setSelfPaths].filter((p) => right.setSelfPaths.has(p)),
        ),
    );
};

// on every assign
export function* setHadAssign(
    eff: Ast.Effects,
    lvalue: Ast.LValue,
): Ast.WithLog<Ast.Effects> {
    const setSelfPaths = new Set(eff.setSelfPaths);
    switch (lvalue.kind) {
        case "self": {
            // self = ...;
            yield ENoSelfAssign(lvalue.loc);
            break;
        }
        case "field_access": {
            if (lvalue.aggregate.kind === "self") {
                // self.x = ...;
                setSelfPaths.add(lvalue.field.text);
            }
            break;
        }
        case "var": {
            // x = ...;
        }
    }
    return Ast.Effects(eff.returnOrThrow, setSelfPaths);
}
const ENoSelfAssign = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Cannot assign to self`)],
});

// on every return or throw
export function* setHadExit(
    eff: Ast.Effects,
    successful: boolean,
    required: undefined | ReadonlySet<string>,
    returnLoc: Ast.Loc,
): Ast.WithLog<Ast.Effects> {
    if (successful && required) {
        const missing = [...required].filter((p) => !eff.setSelfPaths.has(p));
        for (const fieldName of missing) {
            yield EMissingSelfInit(fieldName, returnLoc);
        }
    }
    return Ast.Effects(true, eff.setSelfPaths);
}
const EMissingSelfInit = (name: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(`Field "self.${name}" is not initialized by this moment`),
    ],
});
