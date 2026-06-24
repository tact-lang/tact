struct Chain1 { next: Chain2; }
struct Chain2 { next: Chain3; }
struct Chain3 { final: Int; }

contract TestContract {
    chain: Chain1;

    init() {
        self.chain = Chain1 {
            next: Chain2 {
                next: Chain3 {
                    final: 123
                }
            }
        };
    }
}
