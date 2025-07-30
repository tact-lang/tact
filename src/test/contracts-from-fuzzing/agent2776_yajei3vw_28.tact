struct A { x: Int? }
struct B { y: A? }
struct C { z: B? }

contract MultiOptChain {
    v: C;

    init() {
        self.v = C{ z: null };
    }
}
