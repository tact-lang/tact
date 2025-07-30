struct A { x: Int; }
struct B { y: Bool?; }
struct C { z: String; }
struct D { inner: B; c: C; }

struct Container {
    a: A;
    d: D;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{
            a: A{ x: 1 },
            d: D{
                inner: B{ y: null },
                c: C{ z: "hi" }
            }
        };
    }
}
