struct A { x: Int; y: Int }
struct B { a: A; z: Int }

contract Test {
    f: B;

    init() {
        self.f = B{a: A{x: 1, y:2}, z:3};
    }
}