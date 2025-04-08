struct W1 { f: Int; }
struct W2 { f1: W1; f2: W1; }
struct W3 { f1: W2; f2: W2; }

contract WideNested {
    s: W3;

    init() {
        self.s = W3{
            f1: W2{
                f1: W1{ f:1 },
                f2: W1{ f:2 }
            },
            f2: W2{
                f1: W1{ f:3 },
                f2: W1{ f:4 }
            }
        };
    }
}