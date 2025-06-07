struct S1 { x: Int }
struct S2 { y: Int }
struct S3 { z: Int }

struct Container {
    f1: S1;
    f2: S2;
    f3: S3;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            f1: S1{ x:1 },
            f2: S2{ y:2 },
            f3: S3{ z:3 },
        };
    }
}
