struct ComplexOne {
    a: Int;
    b: String?;
}

struct ComplexTwo {
    c: Bool;
    d: Int;
    e: ComplexOne;
}

struct ComplexThree {
    f: ComplexTwo?;
    g: String;
}

contract ManyNestedOptionals {
    data: ComplexThree;
    init() {
        self.data = ComplexThree{
            f: null,
            g: "deep"
        };
    }
}
