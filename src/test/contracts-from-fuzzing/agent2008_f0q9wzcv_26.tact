struct Chain1 { val: Int; }
struct Chain2 { next: Chain1; }
struct Chain3 { next: Chain2; }
struct Chain4 { next: Chain3; }
struct Chain5 { next: Chain4; }

contract VeryDeepNestedTest {
    x: Chain5;

    init() {
        self.x = Chain5{
            next: Chain4{
                next: Chain3{
                    next: Chain2{
                        next: Chain1{ val: 123 }
                    }
                }
            }
        };
    }
}
