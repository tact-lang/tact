struct DeepNest {
    a: Int;
    b: Nested;
}

struct Nested {
    c: Int;
    d: Deeper;
}

struct Deeper {
    e: Int;
    f: String;
}

contract TestContract {
    testField: DeepNest;

    init() {
        self.testField = DeepNest{
            a: 1,
            b: Nested{
                c: 2,
                d: Deeper{
                    e: 3,
                    f: "hello"
                }
            }
        };
    }
}