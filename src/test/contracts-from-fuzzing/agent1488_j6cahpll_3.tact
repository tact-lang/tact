struct Nested1 {
    a: Int;
    b: Bool;
}

struct Nested2 {
    x: Nested1;
    y: Bool?;
    z: String;
}

struct Nested3 {
    m: Nested2;
    n: Int?;
}

contract DeeplyNestedFields {
    val: Nested3;
    
    init() {
        self.val = Nested3{
            m: Nested2{
                x: Nested1{a: 10, b: false},
                y: null,
                z: "hello"
            },
            n: null
        };
    }
}
