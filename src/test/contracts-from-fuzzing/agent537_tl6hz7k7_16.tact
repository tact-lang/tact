struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
    e: Slice;
    f: Address?;
    g: Bool;
    h: Int?;
}

contract TestContract {
    mix: Mix;

    init() {
        self.mix = Mix{
            a: 1,
            b: null,
            c: "abc",
            d: null,
            e: emptyCell().asSlice(),
            f: null,
            g: false,
            h: null
        };
    }

    receive() {
        self.mix = self.mix;
    }
}
