// contract field with optional struct that's nested
struct Leaf { val: Int; }

struct Branch {
    leaf: Leaf?;
    weight: Int;
}

contract Test {
    state: Branch;

    init() {
        self.state = Branch{
            leaf: null,
            weight: 123
        };
    }
}