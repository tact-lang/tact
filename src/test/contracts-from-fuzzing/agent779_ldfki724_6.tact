struct Large {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Bool;
    h: Bool;
    i: Int?;
    j: Int?;
}

contract ManyPersistentFields {
    data: Large;

    init() {
        self.data = Large{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: 6,
            g: true,
            h: false,
            i: null,
            j: null
        };
    }
}