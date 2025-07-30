struct NestedOptional {
    s: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool;
}

contract TestContract {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{ s: null };
    }
}