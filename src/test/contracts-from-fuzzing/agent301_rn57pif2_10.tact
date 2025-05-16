struct C {
    z: Int;
}

struct B {
    y: C;
}

struct A {
    x: B;
}

contract TestContract {
    deep: A;

    init() {
        self.deep = A{
            x: B{
                y: C{
                    z: 999
                }
            }
        };
    }

    receive() {
        let _ = self.deep.x.y.z;
    }
}