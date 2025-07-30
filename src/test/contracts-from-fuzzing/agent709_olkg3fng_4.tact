struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: String?;
    e: Bool?;
    f: String?;
    g: Bool?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: 1,
            b: null,
            c: 3,
            d: "abc",
            e: null,
            f: null,
            g: true,
        };
    }
}