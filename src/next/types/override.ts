/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import type * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { assignType } from "@/next/types/type";
import { assignMethodType } from "@/next/types/type-method";

export function* checkFieldOverride(
    name: string,
    prev: Ast.DeclMem<Ast.Fieldish<
        Ast.Lazy<Ast.DecodedExpression> | undefined
    >> | undefined,
    nextType: Ast.Lazy<Ast.DecodedType>,
    nextVia: Ast.ViaMember,
    override: boolean,
    scopeRef: () => Ast.Scope,
): E.WithLog<void> {
    if (prev) {
        if (prev.decl.kind !== 'constant') {
            // cannot override field with constant
            yield E.ERedefineMember(name, prev.via, nextVia);
        } else if (override) {
            // overriding without override
            yield ENeedOverride(name, prev.via, nextVia);
        } else if (!prev.decl.overridable) {
            // to override it must be virtual or abstract
            yield ENeedAbstract(name, prev.via, nextVia);
        } else {
            // overriding constant
            yield* assignType(
                yield* prev.decl.type(),
                yield* nextType(),
                scopeRef,
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
    prev: Ast.DeclMem<Ast.MethodSig<Ast.Body | undefined>> | undefined,
    nextType: Ast.DecodedMethodType,
    nextVia: Ast.ViaMember,
    override: boolean,
    scopeRef: () => Ast.Scope,
): E.WithLog<void> {
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
                scopeRef,
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
): E.TcError => ({
    loc: next.defLoc,
    descr: [
        E.TEText(`Overriding "${name}" without "override"`),
        E.TEText(`First defined at`),
        E.TEViaMember(prev),
        E.TEText(`Redefined at`),
        E.TEViaMember(next),
    ],
});

const ENeedAbstract = (
    name: string,
    prev: Ast.ViaMember,
    next: Ast.ViaMember,
): E.TcError => ({
    loc: next.defLoc,
    descr: [
        E.TEText(`To override "${name}" it has to be "virtual" or "abstract"`),
        E.TEText(`First defined at`),
        E.TEViaMember(prev),
        E.TEText(`Redefined at`),
        E.TEViaMember(next),
    ],
});

const EEmptyOverride = (
    name: string,
    next: Ast.ViaMember,
): E.TcError => ({
    loc: next.defLoc,
    descr: [
        E.TEText(`To override "${name}" it has to exist`),
        E.TEViaMember(next),
    ],
});