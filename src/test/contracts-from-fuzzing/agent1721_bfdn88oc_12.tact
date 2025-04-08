struct TestOrderA {
    a: Int;
    b: Bool;
    c: String;
}

struct TestOrderB {
    c: String;
    b: Bool;
    a: Int;
}

contract StructOrderTest {
    s1: TestOrderA;
    s2: TestOrderB;

    init() {
        self.s1 = TestOrderA{ a:1, b:true, c:"hi" };
        self.s2 = TestOrderB{ c:"hi", b:true, a:1 };
    }
}
