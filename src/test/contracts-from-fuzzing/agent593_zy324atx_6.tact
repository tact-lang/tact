struct Mix {
    a: Int;
    b: Bool = true;
    c: Int?;
    d: String = "x";
    e: Bool?;
}

contract Mixing {
    dat: Mix = Mix{ a: 1 };
    init() {
        self.dat = Mix{
            a: 42,
            b: false,
            c: null,
            d: "hi",
            e: true,
        };
    }
}