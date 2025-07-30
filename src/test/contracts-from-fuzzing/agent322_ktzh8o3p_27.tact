struct NestedOpt {
    note: String?;
}

struct AllMix {
    i: Int;
    flag: Bool;
    nick: String;
    maybeNumber: Int?;
    nested: NestedOpt;
    nestedOpt: NestedOpt?;
    lastFlag: Bool;
    lastStr: String?;
}

contract StressMix {
    state: AllMix = AllMix{
        i: 1,
        flag: false,
        nick: "X",
        maybeNumber: null,
        nested: NestedOpt{ note: null },
        nestedOpt: null,
        lastFlag: true,
        lastStr: "done"
    };
}