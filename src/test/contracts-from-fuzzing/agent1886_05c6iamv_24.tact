struct Chain1 { next: Chain2; val: Int }
struct Chain2 { next: Chain3; val: Int }
struct Chain3 { next: Chain4; val: Int }
struct Chain4 { val: Int }

contract TestDeepChain {
    data: Chain1;

    init() {
        self.data = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{
                        val: 4
                    }, val:3
                }, val:2
            }, val:1
        };
    }
}