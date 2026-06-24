struct Complex {
    p: Int as int64;
    q: Int as uint32;
    flag: Bool;
}

struct Outer {
    a: Int as uint16;
    b: Bool;
    c: Complex;
}

contract TestContract {
    lots: Outer = Outer{
        a: 5,
        b: true,
        c: Complex{
            p: 12,
            q: 34,
            flag: false
        }
    };
}