struct Mix {
    s1: String;
    s2: String?;
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    sl1: Slice;
    sl2: Slice?;
}

contract TestContract {
    state: Mix;

    init() {
        self.state = Mix{
            s1: "a",
            s2: null,
            i1: 77,
            i2: null,
            b1: false,
            b2: null,
            sl1: emptyCell().asSlice(),
            sl2: null,
        };
    }
}