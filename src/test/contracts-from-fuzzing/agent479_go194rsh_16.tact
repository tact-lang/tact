struct Sub {
    a: Int;
    b: Bool;
}

contract MultiOptional {
    one: Sub?;
    two: Sub?;
    three: Sub?;

    init() {
        self.one = null;
        self.two = null;
        self.three = null;
    }
}