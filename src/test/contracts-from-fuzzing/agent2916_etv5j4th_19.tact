struct BigNested {
    s1: String;
    n1: Nested;
}

struct Nested {
    s2: String;
    n2: Deeper;
}

struct Deeper {
    i: Int;
    flag: Bool;
}

contract BigNestedTest {
    data: BigNested;

    init() {
        self.data = BigNested{
            s1: "AAA",
            n1: Nested{
                s2: "BBB",
                n2: Deeper{
                    i: 100,
                    flag: true,
                }
            }
        };
    }
}