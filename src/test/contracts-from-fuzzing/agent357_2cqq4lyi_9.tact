struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Cell?;
    e: String?;
    f: Address?;
    g: Slice?;
}

contract ManyOptionalStructStorage {
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
        };
    }
}