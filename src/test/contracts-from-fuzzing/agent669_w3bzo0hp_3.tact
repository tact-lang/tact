struct ManyFields {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
    k: Int;
    l: Bool;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: false,
            c: 2,
            d: true,
            e: 3,
            f: false,
            g: 4,
            h: true,
            i: 5,
            j: false,
            k: 6,
            l: true
        };
    }
}
