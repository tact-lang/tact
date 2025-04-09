struct X { x: Int }
struct Y { y: Int }
struct Z { z: Y }

contract Test {
    a: X;
    b: Int;
    c: Z;

    init() {
        self.a = X{x: 1};
        self.b = 2;
        self.c = Z{z: Y{y:3}};
    }
}