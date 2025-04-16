struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
}

contract PartialOpts {
    x: ManyOpts;

    init() {
        self.x = ManyOpts{
            a: 5,
            // b omitted
            c: "hi",
            // d omitted
            e: null,
        };
    }
}