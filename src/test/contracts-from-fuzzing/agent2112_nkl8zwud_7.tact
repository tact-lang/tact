struct MixOptionalAndNormal {
    a: Int?;
    b: Bool;
    c: String?;
    d: Cell;
    e: Bool?;
    f: Slice;
}

contract MixedOptions {
    mixed: MixOptionalAndNormal;

    init() {
        self.mixed = MixOptionalAndNormal{
            a: null,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: false,
            f: emptyCell().asSlice()
        };
    }
}