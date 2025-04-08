struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Bool?;
    g: String?;
}

contract ManyOptionalsTest {
    val: ManyOptionals;
    init() {
        self.val = ManyOptionals{
            a: null, b: null, c: null,
            d: null,
            e: null,
            f: true,
            g: "x",
        };
    }
}