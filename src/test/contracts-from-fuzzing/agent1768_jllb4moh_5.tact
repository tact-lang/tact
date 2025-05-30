struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
}

contract TestContract {
    m: ManyOptionals;
    init() {
        self.m = ManyOptionals{
            a: 1,
            b: true,
            c: null,
            d: "hello",
            e: null,
            f: false,
            g: null,
            h: "world"
        };
    }
    receive() {
        self.m.a = 42;
    }
}