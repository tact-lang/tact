struct S {
    a: Int = 1;
    b: Bool = false;
    f: String = "hello";
    g: Slice?;
    h: Int?;
    i: String?;
    j: Address?;
}

contract TestContract {
    bigS: S;
    init() {
        self.bigS = S{
            a: 10,
            b: true,
            f: "world",
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}
