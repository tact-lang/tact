// Struct with many optional primitives and nested optional string
struct Combo {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    oa: Address?;
    optStruct: Inner?;
}

struct Inner {
    val: Int;
    s: String?;
}

contract OptCombo {
    combo: Combo = Combo{
        oi: null,
        ob: null,
        os: null,
        oc: null,
        oa: null,
        optStruct: null,
    };

    init() {
        self.combo = Combo{
            oi: 5,
            ob: true,
            os: "a",
            oc: emptyCell(),
            oa: myAddress(),
            optStruct: Inner{ val: 10, s: null },
        };
    }
}