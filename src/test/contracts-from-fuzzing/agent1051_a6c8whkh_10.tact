struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    stuff: ManyOptionals;
    init() {
        self.stuff = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: 5,
            e: true,
            f: "opt"
        };
    }
}