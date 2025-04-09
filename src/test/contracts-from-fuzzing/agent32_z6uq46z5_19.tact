struct S1 {
    xx: Int;
}

struct S2 {
    yy: Bool;
}

struct Container {
    a: S1;
    b: S2;
    c: S1;
    d: S2;
}

contract RepeatedStructsTest {
    s: Container;
    init() {
        self.s = Container{
            a: S1{ xx:1 }, b: S2{ yy:true }, c: S1{ xx:2 }, d: S2{ yy:false },
        };
    }
}
