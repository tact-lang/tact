struct Nested {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Nested;
    c: Int;
    d: String;
}

contract DeepStruct {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{
                a: 1,
                b: false
            },
            c: 2,
            d: "test"
        };
    }
}