struct A { X: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }

contract TestNestedToCell {
    receive() {
        let d: D = D { c: C { b: B { a: A { X: 789 } } } };
        dump(d.toCell());
    }
}
