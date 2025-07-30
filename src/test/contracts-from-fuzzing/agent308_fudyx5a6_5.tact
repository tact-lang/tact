struct Nest1 { inner: Bool; }
struct Nest2 { nested: Nest1; }
struct Nest3 { more: Nest2; }
struct Nest4 { deep: Nest3; }

contract DeepChain {
    chain: Nest4;

    init() {
        self.chain = Nest4{
            deep: Nest3{
                more: Nest2{
                    nested: Nest1{
                        inner: true
                    }
                }
            }
        };
    }
}
