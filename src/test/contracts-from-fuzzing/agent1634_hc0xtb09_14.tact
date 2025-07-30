struct S {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool?;
    e: String = "X";
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            a: 3,
            b: false,
            c: null,
            d: true,
            e: "Y",
        };
    }
}