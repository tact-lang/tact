struct DefaultMissing {
    foo: Int;
    bar: Bool = true;
}

contract MissingInit {
    param: DefaultMissing;

    init() {
        self.param = DefaultMissing {
            foo: 1
        };
    }
}