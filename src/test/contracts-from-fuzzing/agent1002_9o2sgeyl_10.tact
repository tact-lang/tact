struct MidNested {
    nested1: Int;
    nested2: String;
}

struct Top {
    inner: MidNested;
    opt: Bool?;
}

contract StructCombo {
    storage: Top;

    init() {
        self.storage = Top{ inner: MidNested{ nested1: 5, nested2: "ok" }, opt: null };
    }
}