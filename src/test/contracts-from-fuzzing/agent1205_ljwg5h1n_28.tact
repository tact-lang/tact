struct SFlag {
    flag: Bool;
}

contract NestedOptionals {
    s: SFlag?;
    init() {
        self.s = null;
    }
}