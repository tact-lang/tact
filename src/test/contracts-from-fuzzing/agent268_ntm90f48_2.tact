struct Deep {
    val: Int;
}

struct Mid {
    val: Deep;
}

struct Top {
    val: Mid;
}

contract DeepNestingTest {
    field: Top;

    init() {
        self.field = Top{ val: Mid{ val: Deep{ val: 123 } } };
    }
}