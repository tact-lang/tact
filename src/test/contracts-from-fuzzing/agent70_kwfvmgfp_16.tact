struct Combo {
    a: Int;
    b: Int?;
    c: Bool = true;
    d: String?;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 1,
            b: null,
            c: false,
            d: null
        };
    }

    receive() {
        self.combo = Combo{
            a: 2,
            b: 7,
            c: true,
            d: "hello"
        };
    }
}