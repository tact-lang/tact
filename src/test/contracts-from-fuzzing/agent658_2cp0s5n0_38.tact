struct Chain5 { next: Chain4 }
struct Chain4 { next: Chain3 }
struct Chain3 { next: Chain2 }
struct Chain2 { next: Chain1 }
struct Chain1 { leaf: Int }

contract ChainDeep {
    field: Chain5;

    init() {
        self.field = Chain5{
            next: Chain4{
                next: Chain3{
                    next: Chain2{
                        next: Chain1{
                            leaf: 2024
                        }
                    }
                }
            }
        };
    }
}