struct MixNested {
    a: Int = 1;
    b: String = "hi";
    c: Bool = true;
    d: Slice;
    e: Builder;
    f: Int?;
    g: Bool?;
}

contract MixNestedStorage {
    data: MixNested;

    init() {
        self.data = MixNested{
            a: 42,
            b: "mix",
            c: false,
            d: emptyCell().asSlice(),
            e: beginCell(),
            f: null,
            g: true
        };
    }

    receive() {
        let _ = self.data.a;
    }
}