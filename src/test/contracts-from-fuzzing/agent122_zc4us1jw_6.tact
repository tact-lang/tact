struct A { a: Int; b: B; }
struct B { x: Int; y: C; }
struct C { z: Int; o: Int?; }

contract NestedChain {
    data: A;

    init() {
        self.data = A{ a: 1, b: B{ x: 2, y: C{ z: 3, o: null } } };
    }
}