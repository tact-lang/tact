struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract ManyOptDefaults {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}