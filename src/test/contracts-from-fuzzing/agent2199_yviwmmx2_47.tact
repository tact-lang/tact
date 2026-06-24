struct B {
    s: C;
}

struct C {
    val: Int;
}

contract NestedReassign {
    b: B;
    init() {
        self.b = B{s:C{val:1}};
        self.b = B{s:C{val:100}};
    }
}
