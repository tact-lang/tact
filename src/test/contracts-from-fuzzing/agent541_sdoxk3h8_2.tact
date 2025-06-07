struct Sub {
    foo: Int;
    bar: Bool?;
}

contract OptNestedParams {
    param: Sub?;

    init() {
        self.param = null;
    }
}