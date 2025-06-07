message(1) StatusMsg {
    ok: Bool;
}

struct SubStruct {
    counter: Int as uint32;
    active: Bool;
}

struct Combo {
    id: Int as int64;
    label: String?;
    status: StatusMsg;
    nested: SubStruct?;
}

contract ComplexCombo {
    data: Combo;

    init() {
        self.data = Combo{
            id: -500,
            label: null,
            status: StatusMsg{ ok: true },
            nested: null,
        };
    }
}