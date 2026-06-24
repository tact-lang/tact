struct InnerMost {
    x: Int;
}

struct Inner {
    im: InnerMost;
    flag: Bool;
}

message Msg {
    data: Int;
}

contract StructsMsgsCombo {
    field: Inner = Inner {
        im: InnerMost{ x: 9 },
        flag: true
    };
    msginst: Msg = Msg{ data: 42 };

    init() {}
}