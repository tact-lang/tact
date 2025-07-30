struct OptInner {
    foo: Int?;
    bar: Bool?;
}

contract NestedOptionals {
    data: OptInner?;

    init() {
        self.data = null;
    }
}