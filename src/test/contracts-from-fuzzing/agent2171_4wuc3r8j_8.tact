struct Child1 {
    x: Int;
}

struct Child2 {
    y: Bool;
}

struct Parent {
    field1: Child1;
    field2: Child2;
}

contract SiblingStructs {
    data: Parent;

    init() {
        self.data = Parent{
            field1: Child1{ x: 7 },
            field2: Child2{ y: true }
        };
    }
}