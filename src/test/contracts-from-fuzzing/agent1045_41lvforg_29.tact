// nested struct with serialization annotation on nested fields
struct Nested {
    a: Int as uint32;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Nested;
    z: Bool;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            x: 10,
            y: Nested{a:1234, b:true},
            z: false
        };
    }
}