struct RecA {
    val: Int;
}

struct RecB {
    rec: RecA;
    val: Int;
}

contract NamesShadow {
    value: RecB;

    init() {
        self.value = RecB{rec: RecA{val: 1}, val: 2};
    }
}