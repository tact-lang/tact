struct RecA {
    next: RecB?;
}

struct RecB {
    val: Int;
}

contract OptionalRecursiveExample {
    data: RecA;

    init() {
        self.data = RecA{next: null};
    }
}