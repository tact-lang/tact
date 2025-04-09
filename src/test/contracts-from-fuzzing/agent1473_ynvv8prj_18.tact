struct Deep {
    a: Int;
    nested: Nested;
}

struct Nested {
    b: Int;
    deeper: Deeper;
}

struct Deeper {
    c: Int;
    d: Int;
}

contract TestContract {
    deep: Deep;

    init() {
        self.deep = Deep{
            a:1,
            nested: Nested{
                b:2,
                deeper: Deeper{c:3,d:4}
            }
        };
    }
}