struct S {
    a: Int;
}

contract NestedOptionalOuter {
    data: S?;

    init() {
        self.data = null;
    }
}