struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice;
    e: Cell?;
    f: Int?;
}

contract MixedOptionalsAndPrimitives {
    storage: Mix;

    init() {
        self.storage = Mix{
            a: 1,
            b: null,
            c: "hi",
            d: emptyCell().asSlice(),
            e: null,
            f: null,
        };
    }
}