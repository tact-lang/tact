struct ComposeA {
    val: Int;
}

struct ComposeB {
    val: Bool;
}

contract MultipleStructFields {
    first: ComposeA;
    second: ComposeB;

    init() {
        self.first = ComposeA{val: 1};
        self.second = ComposeB{val: false};
    }
}