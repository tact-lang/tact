struct Bar {
    foo: Int;
    txt: String;
}

contract OptionalStructSome {
    maybe: Bar?;
    init() {
        self.maybe = Bar{foo:5, txt:"hi"};
    }
}