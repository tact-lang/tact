struct X1 { a: Int }
struct X2 { x1: X1 }
struct X3 { x2: X2 }
struct X4 { x3: X3 }

contract DeepChain {
    field: X4;
    init() {
        self.field = X4{
            x3: X3{
                x2: X2{
                    x1: X1{ a: 123 }
                }
            }
        };
    }
}
