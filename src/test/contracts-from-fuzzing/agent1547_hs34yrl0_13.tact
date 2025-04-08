struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyOptionalsTest {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            a: null,
            b: false,
            c: "hi",
            d: 42,
            e: null,
            f: null
        };
    }
}