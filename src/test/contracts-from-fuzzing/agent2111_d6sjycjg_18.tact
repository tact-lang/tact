// deep nesting mix of optionals and non-optionals
struct L4 { val: Int; }
struct L3 { sub: L4?; }
struct L2 { sub: L3; }
struct L1 { sub: L2?; }

contract DeepMixOpt {
    x: L1;

    init() {
        self.x = L1{
            sub: L2{
                sub: L3{
                    sub: L4{ val: 99 }
                }
            }
        };
    }
}