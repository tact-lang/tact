struct B {
    x: Int;
}

struct A {
    b: B;
}

contract AssignThenReplace {
    val: A;
    init() {
        self.val = A{b:B{x:1}};
        self.val = A{b:B{x:2}};
    }
}