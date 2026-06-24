struct Child {
    x: Int;
    y: Bool;
    z: String?;
}

struct Parent {
    one: Int;
    two: Child;
    three: Bool;
}

contract NestedStructs {
    data: Parent;
    init() {
        self.data = Parent{
            one: 111,
            two: Child{x: 222, y: true, z: null},
            three: false
        };
    }
}