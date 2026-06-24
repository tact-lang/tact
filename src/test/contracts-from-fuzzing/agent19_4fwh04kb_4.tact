struct A { val: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }

contract TestContract {
    receive() {
        let d: D = D { c: C { b: B { a: A { val: 123 } } } };
        dump(d.c.b.a.val);
    }
}
