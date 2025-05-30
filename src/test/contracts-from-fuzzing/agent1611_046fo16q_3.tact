struct Nested {
    one: Int;
    two: Int?;
    three: Int;
    four: Int?;
    five: Int;
}

contract ManyOptionals {
    foo: Nested;

    init() {
        self.foo = Nested{ one: 1, two: null, three: 3, four: null, five: 5 };
    }
}
