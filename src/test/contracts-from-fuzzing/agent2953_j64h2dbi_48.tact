// Nested structs with serialization directives
struct Child {
    x: Int as uint4;
    y: Bool;
}

struct Parent {
    child: Child;
    z: String;
}

contract SerdeNested {
    data: Parent;

    init() {
        self.data = Parent{
            child: Child{
                x: 12,
                y: false
            },
            z: "hi"
        };
    }
}