struct Chain1 { nested: Chain2; }
struct Chain2 { nested: Chain3; }
struct Chain3 { nested: Chain4; }
struct Chain4 { nested: Chain5; }
struct Chain5 { leaf: Int; }

contract LongChain {
    data: Chain1 = Chain1{
        nested: Chain2{
            nested: Chain3{
                nested: Chain4{
                    nested: Chain5{
                        leaf: 42
                    }
                }
            }
        }
    };

    init() {}
}