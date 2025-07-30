struct Combo {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
}

contract Test {
    data: Combo;

    init() {
        self.data = Combo{
            a: 1,
            b: null,
            c: "hello",
            d: null
        };
    }
}
