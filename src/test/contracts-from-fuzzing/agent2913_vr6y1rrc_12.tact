struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Slice;
    f: Cell?;
}

contract ManyMixFields {
    m: Mix;

    init() {
        self.m = Mix{
            a: 77,
            b: null,
            c: "str",
            d: null,
            e: emptyCell().asSlice(),
            f: null,
        };
    }
}