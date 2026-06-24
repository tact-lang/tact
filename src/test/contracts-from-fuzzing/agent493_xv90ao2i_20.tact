struct X { a: Int; }
struct Y { b: X; }
struct Z { c: Y; }

contract ChainDefaults {
    store: Z;

    init() {
        self.store = Z{
            c: Y{
                b: X{
                    a: 42
                }
            }
        };
    }
}