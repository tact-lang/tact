struct Mix {
    a: Int;
    b: Int = 2;
    c: Int?;
    d: Bool = true;
    e: Bool?;
}

contract Test {
    mix: Mix;

    init() {
        self.mix = Mix{
            a: 1,
            c: null,
            e: null,
        };
    }
}
