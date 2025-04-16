struct VeryDeep1 { x: Int; }
struct VeryDeep2 { next: VeryDeep1; }
struct VeryDeep3 { next: VeryDeep2; }
struct VeryDeep4 { next: VeryDeep3; }
struct VeryDeep5 { next: VeryDeep4; }

contract DeepChain {
    chain: VeryDeep5;

    init() {
        self.chain = VeryDeep5{
            next: VeryDeep4{
                next: VeryDeep3{
                    next: VeryDeep2{
                        next: VeryDeep1{ x: 1 }
                    }
                }
            }
        };
    }
}