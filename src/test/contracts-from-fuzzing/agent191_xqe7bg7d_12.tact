struct Inner {
    num: Int;
    flag: Bool;
}

contract NestedOptionals {
    s: Inner?;
    s2: Inner?;

    init() {
        self.s = null;
        self.s2 = null;
    }
}