struct OptionalDeepNesting {
    a: Int?;
    b: Nested1?;
}

struct Nested1 {
    c: Bool?;
    d: Nested2?;
}

struct Nested2 {
    e: String?;
}

contract OptionalDeepNestingTest {
    data: OptionalDeepNesting;

    init() {
        self.data = OptionalDeepNesting{
            a: null,
            b: Nested1{
                c: null,
                d: Nested2{
                    e: null
                }
            }
        };
    }
}
