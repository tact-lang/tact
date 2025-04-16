struct Basic {
    foo: Int;
}

contract OptionalStructInContract {
    b: Basic?;

    init() {
        self.b = Basic{foo: 10};
    }
}