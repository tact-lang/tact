struct Child1 {
    foo: Int;
}

struct Child2 {
    bar: Bool;
}

struct Parent {
    c1: Child1;
    c2: Child2;
}

contract TwoNestedStructs {
    combined: Parent;

    init() {
        self.combined = Parent{
            c1: Child1{foo:1},
            c2: Child2{bar:true}
        };
    }
}