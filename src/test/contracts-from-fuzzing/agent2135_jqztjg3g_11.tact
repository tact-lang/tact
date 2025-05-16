struct S1 {
    v1: Int;
    v2: Bool;
}

contract MultiStructsTest {
    s1: S1;
    s2: S1;

    init() {
        self.s1 = S1{v1: 11, v2: true};
        self.s2 = S1{v1: 22, v2: false};
    }
}