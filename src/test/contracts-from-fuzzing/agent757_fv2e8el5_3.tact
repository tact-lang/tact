struct LargeTuple {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool;
    e: Int;
    f: Int?;
    g: Bool;
    h: Int;
    i: Bool;
}

contract ManyFieldTypes {
    state: LargeTuple;

    init() {
        self.state = LargeTuple{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 2,
            f: 3,
            g: false,
            h: 4,
            i: true
        };
    }
}