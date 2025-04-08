struct DeepNested {
    val: Int;
}

struct NestedOpt {
    sub: DeepNested?;
}

contract TestContract {
    data: NestedOpt?;

    init() {
        self.data = null;
    }
}