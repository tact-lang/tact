struct Inner {
    x: Int;
    y: Bool;
}

contract NestedOptionalStruct {
    item: Inner?;

    init() {
        self.item = null;
    }
}