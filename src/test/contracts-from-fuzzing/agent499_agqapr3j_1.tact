struct Inner {
    flag: Bool;
    number: Int;
}

contract NestedOptionals {
    data: Inner?;

    init() {
        self.data = null;
    }
}