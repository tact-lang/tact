struct Optionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Address?;
    f: String?;
}

contract MultiOptional {
    optData: Optionals;

    init() {
        self.optData = Optionals{
            a: null,
            b: 2,
            c: null,
            d: true,
            e: null,
            f: "hello"
        };
    }
}