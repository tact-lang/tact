struct MultiLevel {
     a: Int;
     b: Bool;
     c: String;
     d: Nested1;
}

struct Nested1 {
    e: Int?;
    f: Nested2;
}

struct Nested2 {
    g: Bool?;
    h: String;
}

contract DeepNested {
    data: MultiLevel;

    init() {
        self.data = MultiLevel{
            a: 1,
            b: false,
            c: "abc",
            d: Nested1{
                e: null,
                f: Nested2{
                    g: true,
                    h: "xyz"
                }
            }
        };
    }
}