struct RecA {
    f1: Int;
    f2: RecB;
}

struct RecB {
    s1: String;
    s2: RecC;
}

struct RecC {
    b: Bool;
}

contract RecursionTest {
    val: RecA;
    init() {
        self.val = RecA{
            f1: 1,
            f2: RecB{
                s1: "abc",
                s2: RecC{ b: true }
            }
        };
    }
}