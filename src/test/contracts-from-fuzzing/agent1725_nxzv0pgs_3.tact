struct S1 {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    s: S1;

    init() {
        self.s = S1{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "test",
            f: null,
        };
    }
}