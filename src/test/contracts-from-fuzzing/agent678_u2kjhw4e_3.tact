struct DeepNested {
    innermost: Int;
}

struct Outer {
    middle: DeepNested;
}

contract TestContract {
    val: Outer;
    init() {
        self.val = Outer{ middle: DeepNested{ innermost: 99 } };
    }
}