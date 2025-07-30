// test deeply nested persistent fields up to 5 levels
struct L5 { val: Int; }
struct L4 { next: L5; }
struct L3 { next: L4; }
struct L2 { next: L3; }
struct L1 { next: L2; }

contract TestContract {
    chain: L1;

    init() {
        self.chain = L1{
            next: L2{
                next: L3{
                    next: L4{
                        next: L5{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}