struct Child1 {
    val: Int;
}

struct Child2 {
    label: String;
}

struct Parent {
    c1: Child1;
    c2: Child2;
    flag: Bool;
}

contract MultipleStructs {
    ps: Parent;

    init() {
        self.ps = Parent{
            c1: Child1{val: 99},
            c2: Child2{label: "hi"},
            flag: true
        };
    }
}
