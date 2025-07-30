struct DeepOptionalNested {
    a: Int?;
    b: Nested1?;
}

struct Nested1 {
    x: Int?;
    y: Nested2?;
}

struct Nested2 {
    q: Int?;
    r: Nested3?;
}

struct Nested3 {
    s: Int?;
}

contract DeepOptionalNestedContract {
    data: DeepOptionalNested;

    init() {
        self.data = DeepOptionalNested{
            a: null,
            b: Nested1{
                x: null,
                y: Nested2{
                    q: null,
                    r: Nested3{
                        s: null
                    }
                }
            }
        };
    }
}
