struct X { a: Int; }
struct Y { b: X; }
struct Z { c: Y; }
contract NestedChainFinal {
    d: Z;

    init() {
        self.d = Z{
            c: Y{ b: X{ a:123 } }
        };
    }
}