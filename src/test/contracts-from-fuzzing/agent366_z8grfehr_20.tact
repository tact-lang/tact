struct Sub {
    foo: Int = 7;
    bar: Bool = true;
}

contract OptionalStructNull {
    nest: Sub?;

    init() {
        self.nest = null;
    }
}