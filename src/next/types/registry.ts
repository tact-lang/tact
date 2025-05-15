import type * as V from "@/next/types/via";
import type * as E from "@/next/types/errors";

export interface Registry<Key, Val, Reg> {
    empty(): Reg;
    create(key: Key, value: Val, via: V.ViaUser): Reg;
    mapVia(fns: Reg, cb: (via: V.ViaUser) => V.ViaUser): Reg;
    append(prev: Reg, next: Reg): E.WithLog<Reg>;
}
