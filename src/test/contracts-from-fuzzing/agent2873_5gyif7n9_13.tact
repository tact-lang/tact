struct Child1 {
    f: Bool;
}

struct Child2 {
    s: String;
}

struct Parent {
    c1: Child1;
    c2: Child2;
}

contract AssignPartial {
    val: Parent;

    init() {
        self.val = Parent{
            c1: Child1{f: true},
            c2: Child2{s: "hi"}
        };
    }
}