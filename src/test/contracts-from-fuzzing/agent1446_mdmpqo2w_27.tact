struct X { a: Int }
struct Y { b: Int }
struct Z { c: Int }

contract MultiStructs {
    x: X;
    y: Y;
    z: Z;
    init() {
        self.x = X{a:1};
        self.y = Y{b:2};
        self.z = Z{c:3};
    }
}
