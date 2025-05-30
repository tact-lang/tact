// nested optional struct with fields
struct Child {
    x: Int;
    y: Bool;
}

struct Parent {
    child: Child?;
    z: String;
}

contract NestedOptField {
    data: Parent;
    init() {
        self.data = Parent{
            child: null,
            z: "hello",
        };
    }
}