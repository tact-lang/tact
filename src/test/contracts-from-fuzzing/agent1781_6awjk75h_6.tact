struct X1 { a: Int; }
struct X2 { b: Int; x1: X1; }
struct X3 { c: Int; x2: X2; }
struct X4 { d: Int; x3: X3; }
struct X5 { e: Int; x4: X4; }
struct X6 { f: Int; x5: X5; }

contract DeepChain {
    deep: X6;

    init() {
        self.deep = X6 {
            f: 6,
            x5: X5 {
                e: 5,
                x4: X4 {
                    d: 4,
                    x3: X3 {
                        c: 3,
                        x2: X2 {
                            b: 2,
                            x1: X1{
                                a:1
                            }
                        }
                    }
                }
            }
        };
    }
}