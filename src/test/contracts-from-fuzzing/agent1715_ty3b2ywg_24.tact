struct Chain1 { next: Chain2 }
struct Chain2 { next: Chain3 }
struct Chain3 { next: Chain4 }
struct Chain4 { next: Chain5 }
struct Chain5 { leaf: Int }

contract TestContract {
    chain: Chain1 = Chain1{
        next: Chain2{
            next: Chain3{
                next: Chain4{
                    next: Chain5{
                        leaf: 123
                    }
                }
            }
        }
    };
}