struct D { z: Int; }

struct C { d: D?; }

struct B { c: C?; }

struct A { b: B?; }

contract OptionalCascade {
    store: A? = null;

    init() {
        self.store = A{
            b: B{
                c: null
            }
        };
    }
}
