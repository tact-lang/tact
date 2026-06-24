contract MixedOptionals {
    data: Data;

    init() {
        self.data = Data{
            a: 1,
            b: null,
            c: 2,
            d: true,
            e: null,
            f: false,
            g: 3,
            h: null
        };
    }
}

struct Data {
    a: Int;
    b: Int?;
    c: Int;
    d: Bool;
    e: Bool?;
    f: Bool;
    g: Int;
    h: Int?;
}
