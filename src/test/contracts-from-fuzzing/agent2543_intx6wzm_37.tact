struct A {
    f1: Int;
    f2: Bool;
}

struct B {
    s: String;
    refA: A;
}

contract NestedReassign {
    var1: A;
    var2: B;
    init() {
        self.var1 = A { f1: 1, f2: true };
        self.var2 = B { s: "abc", refA: self.var1 };
        self.var1 = A { f1: 5, f2: false };
    }
}