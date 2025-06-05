import * as Ast from "@/next/ast";
import { assignMethodType, assignType } from "@/next/types/type";
import { emptyTypeParams } from "@/next/types/type-params";

export function* checkFieldOverride(
    name: string,
    prev:
        | Ast.DeclMem<
              Ast.CFieldish<Ast.Thunk<Ast.Recover<Ast.Value>> | undefined>
          >
        | undefined,
    nextType: Ast.Thunk<Ast.CType>,
    nextVia: Ast.ViaMember,
    override: boolean,
): Ast.WithLog<void> {
    if (prev) {
        if (prev.decl.kind !== "constant") {
            // cannot override field with constant
            yield Ast.ERedefineMember(name, prev.via, nextVia);
        } else if (override) {
            // overriding without override
            yield ENeedOverride(name, prev.via, nextVia);
        } else if (!prev.decl.overridable) {
            // to override it must be virtual or abstract
            yield ENeedAbstract(name, prev.via, nextVia);
        } else {
            // overriding constant
            yield* assignType(
                nextVia.defLoc,
                emptyTypeParams,
                yield* prev.decl.type(),
                yield* nextType(),
                true,
            );
        }
    } else {
        if (override) {
            // override of nothing
            yield EEmptyOverride(name, nextVia);
        } else {
            // defining new constant
        }
    }
}

export function* checkMethodOverride(
    name: string,
    prev: Ast.DeclMem<Ast.CMethod<Ast.CBody | undefined>> | undefined,
    nextType: Ast.CTypeMethod,
    nextVia: Ast.ViaMember,
    override: boolean,
): Ast.WithLog<void> {
    if (prev) {
        if (override) {
            // overriding without override
            yield ENeedOverride(name, prev.via, nextVia);
        } else if (!prev.decl.overridable) {
            // to override it must be virtual or abstract
            yield ENeedAbstract(name, prev.via, nextVia);
        } else {
            // overriding method
            yield* assignMethodType(
                prev.decl.type,
                nextType,
                prev.via,
                nextVia,
            );
        }
    } else {
        if (override) {
            // override of nothing
            yield EEmptyOverride(name, nextVia);
        } else {
            // defining new method
        }
    }
}

const ENeedOverride = (
    name: string,
    prev: Ast.ViaMember,
    next: Ast.ViaMember,
): Ast.TcError => ({
    loc: next.defLoc,
    descr: [
        Ast.TEText(`Overriding "${name}" without "override"`),
        Ast.TEText(`First defined at`),
        Ast.TEViaMember(prev),
        Ast.TEText(`Redefined at`),
        Ast.TEViaMember(next),
    ],
});

const ENeedAbstract = (
    name: string,
    prev: Ast.ViaMember,
    next: Ast.ViaMember,
): Ast.TcError => ({
    loc: next.defLoc,
    descr: [
        Ast.TEText(
            `To override "${name}" it has to be "virtual" or "abstract"`,
        ),
        Ast.TEText(`First defined at`),
        Ast.TEViaMember(prev),
        Ast.TEText(`Redefined at`),
        Ast.TEViaMember(next),
    ],
});

const EEmptyOverride = (name: string, next: Ast.ViaMember): Ast.TcError => ({
    loc: next.defLoc,
    descr: [
        Ast.TEText(`To override "${name}" it has to exist`),
        Ast.TEViaMember(next),
    ],
});
