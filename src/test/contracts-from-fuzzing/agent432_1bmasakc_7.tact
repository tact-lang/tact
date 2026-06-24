struct Sub {
    s1: Int;
    s2: Bool = false;
}

struct Outer {
    a: Int;
    b: Int?;
    c: Bool?;
    d: Sub;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            a: 10,
            b: null,
            c: true,
            d: Sub{
                s1: 99,
                s2: true,
            },
        };
    }
}