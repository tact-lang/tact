struct ManyNested {
    s1: Int;
    s2: Nested1;
    s3: Nested2;
}

struct Nested1 {
    sub: Int;
    optFlag: Bool?;
}

struct Nested2 {
    sub: String;
    optRef: Address?;
}

contract ManyNestedContract {
    data: ManyNested;

    init() {
        self.data = ManyNested{
            s1: 77,
            s2: Nested1{ sub: 11, optFlag: null },
            s3: Nested2{ sub: "nesting", optRef: null }
        };
    }
}