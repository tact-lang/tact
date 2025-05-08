struct CombineFields {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice;
}

contract MixItUp {
    mix: CombineFields;

    init() {
        self.mix = CombineFields {
            a: 5,
            b: null,
            c: "text",
            d: emptyCell().asSlice()
        };
    }
}
