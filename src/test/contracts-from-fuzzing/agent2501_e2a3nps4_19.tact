struct Outer1 {
    value: Int;
}

struct Outer2 {
    nested: Outer1;
}

contract OptionalOuter2 {
    data: Outer2?;

    init() {
        self.data = null;
    }
}