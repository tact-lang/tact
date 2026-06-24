struct Nested1 {
    x: Int;
    y: Bool;
}

struct Nested2 {
    a: Nested1;
    b: String;
}

struct OuterMost {
    n2: Nested2;
    flag: Bool;
    text: String;
}

contract DeepLayers {
    field: OuterMost;
    init() {
        self.field = OuterMost{
            n2: Nested2{
                a: Nested1{x: 10, y: true},
                b: "mid"
            },
            flag: false,
            text: "outer"
        };
    }
}