struct C {
    q: Int?;
    w: Bool = true;
}

struct B {
    z: Int = 99;
    c: C = C{};
}

struct A {
    x: Int?;
    b: B = B{};
}

contract TestContract {
    data: A;
    init() {
        self.data = A{
            x: 1,
            b: B{
                z: 123,
                c: C{
                    q: 555,
                    w: false
                }
            }
        };
    }
}