struct RecursionA {
    inner: RecursionB?;
    count: Int;
}

struct RecursionB {
    value: Int;
}

contract RecursiveOptionals {
    root: RecursionA;

    init() {
        self.root = RecursionA{inner: null, count: 0};
    }
}
