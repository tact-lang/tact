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

contract OptionalStruct {
    data: ManyOptionals = ManyOptionals{};

    init() {
        self.data = ManyOptionals{
            a: 1,
            b: true,
            c: "one",
            d: myAddress(),
            e: 2,
            f: false,
            g: "two",
            h: myAddress(),
        };
    }
}