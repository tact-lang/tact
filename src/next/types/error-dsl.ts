import { throwInternal } from "@/error/errors";
import type { Range } from "@/next/ast";
import type * as V from "@/next/types/via";

export type TcError = {
    // location where IDE should show this error
    readonly loc: Range;
    // text description
    readonly descr: readonly TELine[];
}

export type TELine = TEText | TEVia;

export type TEText = {
    readonly kind: 'text';
    readonly text: string;
}

export const TEText = (text: string): TEText => ({ kind: 'text', text });

export type TEVia = {
    readonly kind: 'via';
    readonly via: V.Via;
}

export const TEVia = (via: V.Via): TEVia => ({ kind: 'via', via });

export const viaToRange = ({ imports, defLoc: definedAt }: V.ViaUser): Range => {
    const [head] = imports;
    if (typeof head === 'undefined') {
        return definedAt;
    }
    const { loc } = head;
    if (loc.kind === 'range') {
        return loc;
    }
    return throwInternal("Implicit import shadows something. Duplicates in stdlib?");
};
