struct X1 { a: Int; }
struct X2 { a: Int; b: X1; }
struct X3 { a: Int; b: X2; }
struct X4 { a: Int; b: X3; }
struct X5 { a: Int; b: X4; }

contract TestContract {
    d: X5;

    init() {
        self.d = X5{
            a: 5,
            b: X4{
                a: 4,
                b: X3{
                    a: 3,
                    b: X2{
                        a: 2,
                        b: X1{
                            a: 1
                        }
                    }
                }
            }
        };
    }
}