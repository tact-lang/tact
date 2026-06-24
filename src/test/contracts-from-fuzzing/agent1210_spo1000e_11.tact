struct X { a: Int; }
struct Y { b: X; }
struct Z { c: Y; }

contract Deep3 {
    data: Z;

    init() {
        self.data = Z{ c: Y{ b: X{ a: 123 } } };
    }
}