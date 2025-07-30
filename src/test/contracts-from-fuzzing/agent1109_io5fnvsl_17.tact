struct BigNested {
    s1: String;
    s2: String;
    n1: Int;
    n2: Int;
    b1: Bool;
    b2: Bool;
    o1: BigNested2;
}

struct BigNested2 {
    q1: Int?;
    q2: Bool?;
    q3: String?;
}

contract BNestedTest {
    value: BigNested;
    
    init() {
        self.value = BigNested{
            s1: "a",
            s2: "b",
            n1: 1,
            n2: 2,
            b1: true,
            b2: false,
            o1: BigNested2{
                q1: 5,
                q2: null,
                q3: "hello",
            },
        };
    }
}