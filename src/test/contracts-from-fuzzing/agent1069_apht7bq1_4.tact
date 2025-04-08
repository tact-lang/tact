struct A1 { next: A2; }
struct A2 { next: A3; }
struct A3 { next: A4; }
struct A4 { next: A5; }
struct A5 { val: Int; }

contract DeepChain {
    chain: A1;

    init() {
        self.chain = A1{
            next: A2{
                next: A3{
                    next: A4{
                        next: A5{
                            val: 12345
                        }
                    }
                }
            }
        };
    }
}