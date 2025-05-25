import type { SourceLogger } from "@/error/logger-util";
import type { Implicit } from "@/next/imports/source";
import type { Loc } from "@/next/ast";
import type * as Ty from "@/next/scoping/generated/type";
import { printType } from "@/next/scoping/print-type";

export type MismatchTree = {
    readonly to: Ty.LocType;
    readonly from: Ty.LocType;
    readonly children: MismatchTree[];
}

export const TcErrors = <M, R>(l: SourceLogger<M, R>) => ({
    shadowsImported: (name: string, prevPath: string, prevRange: Loc | Implicit) => (loc: Loc | Implicit) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`Import from standard library cannot shadow anything`);
        }
        const id = prevRange.kind === 'range'
            ? l.text`"${l.locatedId(name, prevPath, prevRange)}"`
            : l.text`from standard library`;
        return l.at(loc).error(l.text`Declaration of "${name}" shadows previous declaration ${id}`);
    },
    shadowsBuiltin: (name: string) => (loc: Loc | Implicit) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`Import from standard library cannot shadow anything`);
        }
        return l.at(loc).error(l.text`"${name}" is primitive and cannot be redefined`);
    },
    typeNotDefined: (name: string) => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} type is not defined`);
        }
        return l.at(loc).error(l.text`Type "${name}" is not defined`);
    },
    typeArity: (name: string, factualLen: number, expectedLen: number) => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} type arity mismatch`);
        }
        return l.at(loc).error(l.text`Generic type "${name}" expected ${expectedLen.toString()} parameters, but got ${factualLen.toString()}`);
    },
    fnArity: (name: string, factualLen: number, expectedLen: number) => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} arity mismatch`);
        }
        return l.at(loc).error(l.text`"${name}" expected ${expectedLen.toString()} parameters, but got ${factualLen.toString()}`);
    },
    noHkt: (name: string) => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} is a hkt`);
        }
        return l.at(loc).error(l.text`Type variable "${name}" is not a type constructor`);
    },
    instantiationLimit: () => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} too deep`);
        }
        return l.at(loc).error(l.text`Instantiation is excessively deep`);
    },
    typeMismatch: (root: MismatchTree) => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} mismatch`);
        }
        const rec = ({ to, from, children }: MismatchTree, prefix: M, depth: number): M => {
            const padding = new Array(depth + 1).join('  ');
            const row = l.text`${padding}${printType(from)} is not assignable to ${printType(to)}`;
            return children.reduce((message, child) => {
                return rec(child, message, depth + 1);
            }, l.text`${prefix}\n${row}`);
        };
        return l.at(loc).error(rec(root, l.text``, 0));
    },
    danglingTypeParam: () => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} mismatch`);
        }
        // def fun<T>(/* T unused */) { }
        return l.at(loc).error(l.text`Cannot infer type parameter`);
    },
    contractNotDefined: () => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} mismatch`);
        }
        return l.at(loc).error(l.text`No such contract`);
    },
    typeNotContract: () => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} mismatch`);
        }
        return l.at(loc).error(l.text`Type is not a contract`);
    },
    structNotDefined: () => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} mismatch`);
        }
        return l.at(loc).error(l.text`No such struct or message`);
    },
    typeNotStruct: () => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} mismatch`);
        }
        return l.at(loc).error(l.text`Type is not a struct or message`);
    },
    staticMethodNotDefined: () => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} mismatch`);
        }
        return l.at(loc).error(l.text`Only fromCell and fromSlice static methods are supported`);
    },
    noInit: () => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} mismatch`);
        }
        return l.at(loc).error(l.text`Contract has neither init() nor parameters`);
    },
    duplicateField: () => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} mismatch`);
        }
        return l.at(loc).error(l.text`Duplicate field in struct instance`);
    },
    fieldNotDefined: () => (loc: Ty.Loc) => {
        if (loc.kind !== 'range') {
            return l.internal(l.text`${loc.kind} mismatch`);
        }
        return l.at(loc).error(l.text`No such field`);
    },
});

export type TcErrors<M, R> = ReturnType<typeof TcErrors<M, R>>;