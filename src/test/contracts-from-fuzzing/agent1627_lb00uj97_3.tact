struct Sub {
    a: Int;
    b: Bool;
}

contract OptionalNested {
    s: Sub?;

    init() {
        self.s = Sub{ a: 1, b: false };
    }
}