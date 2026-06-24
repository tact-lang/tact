struct S1 {
    x: Int?;
}

struct S2 {
    a: S1?;
}

contract DoubleOptional {
    value: S2?;

    init() {
        self.value = null;
    }
}