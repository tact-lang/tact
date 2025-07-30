struct Inner {
    flag: Bool;
}

contract MustAssign {
    nested: Inner?;
    init() {
        self.nested = null;
    }
}