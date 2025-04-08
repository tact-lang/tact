struct DeepNested {
    a: Int;
    b: Int?;
    c: Nested2;
}

struct Nested2 {
    d: Int;
    e: Nested3;
}

struct Nested3 {
    f: Int;
    g: Bool?;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 1,
            b: null,
            c: Nested2{
                d: 2,
                e: Nested3{
                    f: 3,
                    g: true
                }
            }
        };
    }
}