contract ManyOptPrimitives {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}

struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}
