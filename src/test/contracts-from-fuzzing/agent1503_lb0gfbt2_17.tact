struct L3 {
    x: Int;
}

struct L2 {
    nested: L3?;
}

struct L1 {
    nested: L2?;
}

contract DeeplyNestedOptional {
    nested: L1;

    init() {
        self.nested = L1 { nested: L2 { nested: L3 { x: 5 } } };
    }

    receive() {}
}