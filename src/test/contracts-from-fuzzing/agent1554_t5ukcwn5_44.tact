struct X { x: Int; }
struct Y { y: Int; }
contract MultiSeparateStruct {
    a: X;
    b: Y;

    init() {
        self.a = X{ x: 5 };
        self.b = Y{ y: 6 };
    }
}