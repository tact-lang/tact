struct A { x: Int }
struct B { c: A }
struct C { d: B }
contract NestedChain {
    v: C;
    init() {
        self.v = C{ d: B{ c: A{ x: 5 } } };
    }
}