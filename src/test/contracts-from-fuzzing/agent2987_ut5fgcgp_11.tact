struct Mix {
    a: Int;
    b: Bool;
    c: Address?;
    d: Slice;
    e: Bool?;
    f: Int?;
}

contract MixedTypes {
    data: Mix;

    init() {
        self.data = Mix{
            a: 1,
            b: false,
            c: null,
            d: emptyCell().asSlice(),
            e: true,
            f: null,
        };
    }
}
