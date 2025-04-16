// multiple structs with default values nested
struct X { v: Int = 5 }
struct Y { x: X = X{} }
struct Z { y: Y = Y{} }

contract Test {
    z: Z;

    init() {
        self.z = Z{};
    }
}