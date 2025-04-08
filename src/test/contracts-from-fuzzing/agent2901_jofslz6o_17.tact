struct X1 {
 x: Int;
}
struct X2 {
 y: Bool;
}
struct X3 {
 z: Int?;
}

struct Container {
    f1: X1;
    f2: X2;
    f3: X3;
}

contract Test {
    container: Container;

    init() {
        self.container = Container{
            f1: X1{x: 42},
            f2: X2{y: true},
            f3: X3{z: null}
        };
    }
}