// test chain of nested structs, final optional
struct X { a: Int; }
struct Y { x: X; }
struct Z { y: Y?; }

contract Test {
    f: Z;

    init() {
        self.f = Z{ y: null };
    }
}