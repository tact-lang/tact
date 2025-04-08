struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComplexOptional {
    val: OptStruct;

    init() {
        self.val = OptStruct {
            a: null,
            b: true,
            c: null,
            d: 5,
            e: false,
            f: "hello"
        };
    }
}
