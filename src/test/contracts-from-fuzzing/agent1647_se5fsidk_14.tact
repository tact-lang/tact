struct NestedOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
}

contract TestContract {
    x: NestedOptional;
    init() {
        self.x = NestedOptional{};
    }
    receive() {}
}