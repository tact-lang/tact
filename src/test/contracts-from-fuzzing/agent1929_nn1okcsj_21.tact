struct Parent {
    first: Child;
    second: Child;
}

struct Child {
    v: Int;
    b: Bool?;
}

contract TwoNestedStructs {
    data: Parent;
    init() {
        self.data = Parent{
            first: Child{v: 1, b: null},
            second: Child{v: 2, b: false}
        };
    }
}