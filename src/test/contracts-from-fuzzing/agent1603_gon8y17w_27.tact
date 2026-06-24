struct Mix2 {
    s: String;
    b: Bool?;
    i: Int as uint32;
    f: Bool;
}

contract ComplexMix {
    mix: Mix2;

    init() {
        self.mix = Mix2{
            s: "x",
            b: null,
            i: 42,
            f: true
        };
    }
}