struct Child1 { a: Int; }
struct Child2 { b: Int; }
struct Parent {
    c1: Child1;
    c2: Child2;
    flag: Bool;
}

contract MultipleNestedStructs {
    data: Parent;

    init() {
        self.data = Parent{
            c1: Child1{ a: 1 },
            c2: Child2{ b: 2 },
            flag: true
        };
    }
}