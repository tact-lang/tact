// extreme nested optional-in-struct-in-optional
struct X1 { a: Int?; }
struct X2 { b: X1?; }
struct X3 { c: X2?; }

contract OptionalsInChains {
    root: X3;

    init() {
        self.root = X3{
            c: X2{
                b: X1{
                    a: null
                }
            }
        };
    }
}