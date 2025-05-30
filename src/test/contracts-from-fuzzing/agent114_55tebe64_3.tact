struct LongFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool;
    i: Int;
    j: Bool;
    k: Int?;
    l: Bool;
    m: Int;
    n: Bool;
    o: Int?;
    p: Bool;
}

contract ManyFieldsTest {
    val: LongFields;

    init() {
        self.val = LongFields{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 2,
            f: true,
            g: 3,
            h: false,
            i: 4,
            j: true,
            k: 5,
            l: false,
            m: 6,
            n: true,
            o: 7,
            p: false,
        };
    }
}