struct Nested {
    val: Int;
    flag: Bool;
}

struct Outer {
    nested: Nested;
    status: Bool;
}

contract TestContract {
    record: Outer;
    number: Int;

    init() {
        self.number = 1;
        self.record = Outer{ nested: Nested{ val: 5, flag: false }, status: true };
    }
}