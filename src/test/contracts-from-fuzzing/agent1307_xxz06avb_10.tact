struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapNested {
    nest: NestedOptionals;
    flag: Bool;
}

contract NestedOptTest {
    store: WrapNested = WrapNested{
        nest: NestedOptionals{ a: null, b: null, c: null },
        flag: true
    };

    init() {
        self.store = WrapNested{
            nest: NestedOptionals{ a: 1234, b: true, c: "yo" },
            flag: false
        };
    }
}