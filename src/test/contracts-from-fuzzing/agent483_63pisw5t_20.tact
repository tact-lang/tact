struct Chain1 { inner: Chain2; }
struct Chain2 { inner: Chain3; }
struct Chain3 { inner: Chain4; }
struct Chain4 { value: Int; flag: Bool; }

contract DeepChain {
    root: Chain1;

    init() {
        self.root = Chain1{
            inner: Chain2{
                inner: Chain3{
                    inner: Chain4{
                        value: 42,
                        flag: true
                    }
                }
            }
        };
    }
}
