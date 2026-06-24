struct RecA {
    flag: Bool;
}

struct RecB {
    rec: RecA;
    intVal: Int;
}

contract Test {
    a: RecA;
    b: RecB;

    init() {
        self.a = RecA{flag: true};
        self.b = RecB{rec: RecA{flag: false}, intVal: 99};
    }
}