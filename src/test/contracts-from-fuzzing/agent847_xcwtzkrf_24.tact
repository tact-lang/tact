struct A { i: Int }
struct B { a: A }
struct C { b: B }

contract NestedChain {
    val: C;

    init() {
        self.val = C{ b: B{ a: A{ i: 7 } } };
    }
}