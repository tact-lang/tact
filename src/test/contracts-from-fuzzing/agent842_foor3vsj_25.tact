struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract NestedThree {
    data: C;

    init() {
        self.data = C{
            z: B{
                y: A{
                    x: 1
                }
            }
        };
    }

    receive() {
        let _= self.data;
    }
}