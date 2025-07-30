struct Inner {
    a: String?;
    b: Bool;
}

contract OptStructArrayFields {
    first: Inner?;
    second: Inner?;
    third: Inner?;

    init() {
        self.first = null;
        self.second = null;
        self.third = null;
    }
}
