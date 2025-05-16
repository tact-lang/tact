struct Sub {
    a: Int;
    b: String;
}

contract OptionalNestedStruct {
    sub: Sub?;

    init() {
        self.sub = Sub{
            a: 42,
            b: "nested"
        };
    }
}