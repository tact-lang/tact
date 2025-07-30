struct WideNested {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    sub1: Inner1;
    sub2: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    z: Int;
    flag: Bool;
}

contract WideNestedContract {
    st: WideNested;

    init() {
        self.st = WideNested{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: 3,
            f: true,
            g: 4,
            h: false,
            sub1: Inner1{ x: 5, y: true },
            sub2: Inner2{ z: 6, flag: false },
        };
    }
}