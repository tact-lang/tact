struct HasManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ContractManyOpts {
    rec: HasManyOpts;

    init() {
        self.rec = HasManyOpts{
            a: null,
            b: true,
            c: null,
            d: 10,
            e: null,
            f: "hello"
        };
    }
}