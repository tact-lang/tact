struct X { a: Int; }
struct Y { b: Bool; }
struct Z { c: String; }

contract TestContract {
    x: X;
    y: Y;
    z: Z;

    init() {
        self.x = X{a:10};
        self.y = Y{b:true};
        self.z = Z{c:"hi"};
    }
}