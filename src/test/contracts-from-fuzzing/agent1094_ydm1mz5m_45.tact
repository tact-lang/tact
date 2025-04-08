struct A {
    i: Int;
}

struct B {
    a: A;
}

struct C {
    b1: B;
    b2: B;
}

contract MultiBranch {
    val: C;
    init() {
        self.val = C{b1: B{a:A{i:1}}, b2:B{a:A{i:2}}};
    }
}