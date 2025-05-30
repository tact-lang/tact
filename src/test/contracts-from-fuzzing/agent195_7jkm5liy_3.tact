struct AB {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    s: String;
    sOpt: String?;
}

contract C {
    data: AB;

    init() {
        self.data = AB{
            a: 1,
            b: true,
            c: null,
            d: false,
            s: "hello",
            sOpt: null
        };
    }
}
