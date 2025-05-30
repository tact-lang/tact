// Very large nested chain
struct L1 { next: L2; }
struct L2 { next: L3; }
struct L3 { next: L4; }
struct L4 { next: L5; }
struct L5 { val: Int; }

contract TestContract {
    data: L1;

    init() {
        self.data = L1{
            next: L2{
                next: L3{
                    next: L4{
                        next: L5{ val: 123 }
                    }
                }
            }
        };
    }
}