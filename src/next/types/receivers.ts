/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { decodeStatements } from "@/next/types/statements";
import { decodeDealiasTypeLazy } from "@/next/types/type";

// const hash = commentPseudoOpcode(
//     commentRcv.selector.comment,
//     receivers.fallback !== "undefined",
//     commentRcv.ast.loc,
// );

export function* getReceivers(
    typeName: Ast.TypeId,
    traits: readonly Ast.Decl<Ast.TraitContent>[],
    receivers: readonly Ast.Receiver[],
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.Receivers> {
    const impExternals: Ast.Decl<Ast.RecvSig>[] = [];
    const impInternals: Ast.Decl<Ast.RecvSig>[] = [];
    const impBounces: Ast.Decl<Ast.BounceSig>[] = [];
    for (const { via, decl } of traits) {
        const { external, internal, bounce } = decl.receivers;
        impExternals.push(Ast.Decl(external, via));
        impInternals.push(Ast.Decl(internal, via));
        impBounces.push(Ast.Decl(bounce, via));
    }

    const localInternals: Ast.DeclMem<[Ast.ReceiverSubKind, readonly Ast.Statement[]]>[] = [];
    const localExternals: Ast.DeclMem<[Ast.ReceiverSubKind, readonly Ast.Statement[]]>[] = [];
    const localBounces: Ast.DeclMem<[Ast.TypedParameter, readonly Ast.Statement[]]>[] = [];
    for (const receiver of receivers) {
        const { selector, statements, loc } = receiver;
        const via = Ast.ViaMemberOrigin(typeName.text, loc);
        switch (selector.kind) {
            case "internal":
            case "external": {
                const arr = selector.kind === 'internal'
                    ? localInternals
                    : localExternals;
                arr.push(Ast.DeclMem([selector.subKind, statements], via));
                continue;
            }
            case "bounce": {
                localBounces.push(Ast.DeclMem([selector.param, statements], via));
            }
        }
    }
    return {
        bounce: yield* mergeBounce(typeName, impBounces, localBounces, scopeRef),
        external: yield* mergeReceivers(typeName, impExternals, localExternals, scopeRef),
        internal: yield* mergeReceivers(typeName, impInternals, localInternals, scopeRef),
    };
}

function* mergeReceivers(
    typeName: Ast.TypeId,
    imported: readonly Ast.Decl<Ast.RecvSig>[],
    local: Ast.DeclMem<readonly [Ast.ReceiverSubKind, readonly Ast.Statement[]]>[],
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.RecvSig> {
    const allMessage: Ast.DeclMem<Ast.OpcodeRecv>[] = [];
    let allMessageAny: undefined | Ast.DeclMem<Ast.MessageAnyRecv>;
    let allStringAny: undefined | Ast.DeclMem<Ast.StringAnyRecv>;
    let allEmpty: undefined | Ast.DeclMem<Ast.EmptyRecv>;

    // imported
    for (const { via: viaTrait, decl } of imported) {
        const { message, messageAny, stringAny, empty } = decl;
        for (const { via, decl } of message) {
            const nextVia = Ast.ViaMemberTrait(typeName.text, viaTrait.defLoc, via);
            // we don't check for duplicates in receivers here, because
            // the thing that matters is they have different opcodes
            allMessage.push(Ast.DeclMem(decl, nextVia));
        }
        if (messageAny) {
            const nextVia = Ast.ViaMemberTrait(typeName.text, viaTrait.defLoc, messageAny.via);
            if (allMessageAny) {
                yield ERedefineReceiver("fallback binary", allMessageAny.via, nextVia);
            }
            allMessageAny = Ast.DeclMem(messageAny.decl, nextVia);
        }
        if (stringAny) {
            const nextVia = Ast.ViaMemberTrait(typeName.text, viaTrait.defLoc, stringAny.via);
            if (allStringAny) {
                yield ERedefineReceiver("fallback string", allStringAny.via, nextVia);
            }
            allStringAny = Ast.DeclMem(stringAny.decl, nextVia);
        }
        if (empty) {
            const nextVia = Ast.ViaMemberTrait(typeName.text, viaTrait.defLoc, empty.via);
            if (allEmpty) {
                yield ERedefineReceiver("empty", allEmpty.via, nextVia);
            }
            allEmpty = Ast.DeclMem(empty.decl, nextVia);
        }
    }

    // local
    for (const { via, decl: [subKind, body] } of local) {
        const statements = decodeStatements(body, scopeRef);
        switch (subKind.kind) {
            case "simple": {
                const { name, type } = subKind.param;
                const typeParams = Ast.TypeParams([], new Set());
                const decoded = yield* decodeDealiasTypeLazy(typeParams, type, scopeRef)();
                if (decoded.kind === 'TySlice') {
                    if (allMessageAny) {
                        yield ERedefineReceiver("fallback binary", allMessageAny.via, via);
                    }
                    allMessageAny = Ast.DeclMem(
                        Ast.MessageAnyRecv(name, statements),
                        via,
                    );
                } else if (decoded.kind === 'TypeString') {
                    if (allStringAny) {
                        yield ERedefineReceiver("fallback string", allStringAny.via, via);
                    }
                    allStringAny = Ast.DeclMem(
                        Ast.StringAnyRecv(name, statements),
                        via,
                    );
                } else if (decoded.kind === 'type_ref') {
                    allMessage.push(Ast.DeclMem(
                        Ast.MessageRecv(name, decoded, statements),
                        via,
                    ));
                } else {
                    yield EInvalidRecv(via.defLoc);
                }
                continue;
            }
            case "fallback": {
                if (allEmpty) {
                    yield ERedefineReceiver("fallback string", allEmpty.via, via);
                }
                allEmpty = Ast.DeclMem(
                    Ast.EmptyRecv(statements),
                    via,
                );
                continue;
            }
            case "comment": {
                allMessage.push(Ast.DeclMem(
                    Ast.StringRecv(subKind.comment.value, statements),
                    via,
                ));
                continue;
            }
        }
    }

    return {
        message: allMessage,
        messageAny: allMessageAny,
        stringAny: allStringAny,
        empty: allEmpty,
    };
}

function* mergeBounce(
    typeName: Ast.TypeId,
    imported: readonly Ast.Decl<Ast.BounceSig>[],
    local: readonly Ast.DeclMem<[Ast.TypedParameter, readonly Ast.Statement[]]>[],
    scopeRef: () => Ast.Scope
): E.WithLog<Ast.BounceSig> {
    const allMessage: Ast.DeclMem<Ast.MessageRecv>[] = [];
    let allMessageAny: undefined | Ast.DeclMem<Ast.MessageAnyRecv>;
    
    // imported
    for (const { via: viaTrait, decl: { message, messageAny } } of imported) {
        for (const { via, decl } of message) {
            const nextVia = Ast.ViaMemberTrait(typeName.text, viaTrait.defLoc, via);
            // we don't check for duplicates in receivers here, because
            // the thing that matters is they have different opcodes
            allMessage.push(Ast.DeclMem(decl, nextVia));
        }
        if (messageAny) {
            const nextVia = Ast.ViaMemberTrait(typeName.text, viaTrait.defLoc, messageAny.via);
            if (allMessageAny) {
                yield ERedefineReceiver("fallback binary", allMessageAny.via, nextVia);
            }
            allMessageAny = Ast.DeclMem(messageAny.decl, nextVia);
        }
    }
    
    // local
    for (const { via, decl: [{ name, type }, body] } of local) {
        const statements = decodeStatements(body, scopeRef);
        const typeParams = Ast.TypeParams([], new Set());
        const decoded = yield* decodeDealiasTypeLazy(typeParams, type, scopeRef)();
        if (decoded.kind === 'TySlice') {
            if (allMessageAny) {
                yield ERedefineReceiver("fallback binary", allMessageAny.via, via);
            }
            allMessageAny = Ast.DeclMem(
                Ast.MessageAnyRecv(name, statements),
                via,
            );
        } else if (decoded.kind === 'type_ref' || decoded.kind === 'TypeBounced') {
            allMessage.push(Ast.DeclMem(
                Ast.MessageRecv(name, decoded, statements),
                via,
            ));
        } else {
            yield EInvalidRecv(via.defLoc);
        }
    }
    
    return {
        message: allMessage,
        messageAny: allMessageAny,
    };
}

const EInvalidRecv = (
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Receiver's parameter must be a message type, Slice, or String`),
    ],
});

const ERedefineReceiver = (
    kind: string,
    prev: Ast.ViaMember,
    next: Ast.ViaMember,
): E.TcError => ({
    loc: next.defLoc,
    descr: [
        E.TEText(`There already is a ${kind} receiver`),
        E.TEText(`First defined at`),
        E.TEViaMember(prev),
        E.TEText(`Redefined at`),
        E.TEViaMember(next),
    ],
});