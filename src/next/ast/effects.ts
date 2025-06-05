import type { Loc } from "@/next/ast";

export type Effects = {
    // throws at all times
    readonly mustThrow: boolean;
    // maybe reads from storage
    readonly mayRead: boolean;
    // maybe writes to storage
    readonly mayWrite: boolean;
    // which self.* were assigned to
    readonly mustSetSelf: ReadonlySet<string>;
}

export type Returns = {
    readonly selfSet: ReadonlySet<string>;
    readonly loc: Loc
}
