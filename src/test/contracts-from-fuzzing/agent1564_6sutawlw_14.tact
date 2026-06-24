struct WithManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract ManyOptionalsStorage {
    val: WithManyOptionals;

    init() {
        self.val = WithManyOptionals{
            a: null, b: true, c: null,
            d: 5, e: null, f: "z",
            g: null, h: false, i: "abc"
        };
    }
}