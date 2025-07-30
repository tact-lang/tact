struct Inner {
    flag: Bool;
}

contract OptAssigned {
    nested: Inner?;
    init() {
        self.nested = Inner{ flag: true };
    }
}