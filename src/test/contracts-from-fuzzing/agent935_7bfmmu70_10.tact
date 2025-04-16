struct RecA {
    val: Int;
    other: RecB?;
}

struct RecB {
    flag: Bool;
}

contract RecursionTest {
    rec: RecA;

    init() {
        self.rec = RecA{
            val: 5,
            other: RecB{
                flag: true,
            },
        };
    }

    receive() {}
}