struct NestedBool {
    ok: Bool;
    nice: Bool?;
}

contract OptNestedBool {
    s: NestedBool;

    init() {
        self.s = NestedBool{
            ok: false,
            nice: null
        };
    }
}
