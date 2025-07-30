struct Deep {
    a: Int;
    inner: Nested;
}

struct Nested {
    b: Int;
    inner2: Innermost;
}

struct Innermost {
    c: Int;
}

contract ComplexNestedStructField {
    s: Deep;

    init() {
        self.s = Deep{
            a: 1,
            inner: Nested{
                b: 2,
                inner2: Innermost{
                    c:3
                }
            }
        };
    }
}
