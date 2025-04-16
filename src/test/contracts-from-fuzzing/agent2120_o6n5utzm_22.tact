struct S { a: Int; b: String }

contract AssignOrder {
    s: S;
    init() {
        self.s = S{ b:"second", a:123 };
    }
}