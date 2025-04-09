// deeply nested structs with multiple serialization annotations
struct X { a: Int as uint8; }
struct Y { b: X; }
struct Z { c: Y; }

contract DeepAnn {
    d: Z;
    init() {
        self.d = Z{ c: Y{ b: X{ a: 5 } } };
    }
}