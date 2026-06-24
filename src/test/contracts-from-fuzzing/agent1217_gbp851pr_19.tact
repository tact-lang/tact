struct RecA {
    val: Int;
}

struct RecB {
    a: RecA?;
}

contract RefNullTest {
    field: RecB;
    init() {
        self.field = RecB{
            a: null,
        };
    }
}