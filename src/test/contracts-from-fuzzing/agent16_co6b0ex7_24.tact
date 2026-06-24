struct RecursionA {
    val: Int;
    // forbidden map omitted
}

struct RecursionB {
    a: RecursionA;
}

struct RecursionC {
    b: RecursionB;
}

contract RecursiveTest {
    rec: RecursionC;

    init() {
        self.rec = RecursionC{b: RecursionB{a: RecursionA{val: 1}}};
    }
}