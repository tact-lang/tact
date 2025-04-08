struct NamedOne {
    a: Int;
}

struct NamedTwo {
    a: Int;
}

contract DuplicateNamesTest {
    one: NamedOne;
    two: NamedTwo;

    init() {
        self.one = NamedOne{ a: 5 };
        self.two = NamedTwo{ a: 10 };
    }
}