struct CircA {
    b: CircB?;
}

struct CircB {
    x: Int;
}

contract SemiCircularTest {
    field: CircA;

    init() {
        self.field = CircA{
            b: null,
        };
    }
}