struct A { x: Int }
struct B { a: A? }
struct C { b: B? }

contract TestContract {
    nestedOpt: C;

    init() {
        self.nestedOpt = C{ b: null };
    }
}