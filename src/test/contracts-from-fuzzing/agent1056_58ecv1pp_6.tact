struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Bool?;
}

contract FlatOptionalsStorage {
    big: ManyOptionals;

    init() {
        self.big = ManyOptionals{
            a: null,
            b: "one",
            c: 42,
            d: null,
            e: null,
            f: true,
        };
    }
}