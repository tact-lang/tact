struct RecA {
    val: Int;
    next: RecB?;
}

struct RecB {
    label: String;
}

contract OptionalRecursiveTest {
    root: RecA?;
    init() {
        self.root = null;
    }
}
