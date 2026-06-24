struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
    y: Int;
    flag: Bool;
}

contract OrderingTest {
    s: S2;

    init() {
        self.s = S2{
            s1: S1{ x:11 },
            y: 22,
            flag: true
        };
    }
}
