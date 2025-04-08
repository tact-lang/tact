struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
}

contract ManyOptionals {
    val: Optionals;

    init() {
        self.val = Optionals{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}