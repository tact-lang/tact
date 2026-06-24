struct Stringy {
    a: String;
    b: String?;
}

contract Test {
    s: Stringy;

    init() {
        self.s = Stringy{
            a: "abc",
            b: null,
        };
    }
}