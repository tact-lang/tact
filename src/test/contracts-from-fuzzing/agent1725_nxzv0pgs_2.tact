struct DeeplyNested {
    level1: Nested1;
    level2: Nested2;
}

struct Nested1 {
    i: Int;
    b: Bool;
}

struct Nested2 {
    s: String;
    inner: Nested1;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            level1: Nested1{
                i: 5,
                b: false,
            },
            level2: Nested2{
                s: "abc",
                inner: Nested1{
                    i: 10,
                    b: true,
                }
            }
        };
    }
}