struct A { val: Int }
struct B { a: A? }
struct C { b: B }
struct D { c: C? }
struct E { d: D }

contract Test {
    data: E?;

    init() {
        self.data = null;
    }
}