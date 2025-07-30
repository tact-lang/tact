struct DeepChains1 { inner: Int; }
struct DeepChains2 { prev: DeepChains1; }
struct DeepChains3 { prev: DeepChains2; }
struct DeepChains4 { prev: DeepChains3; }
struct DeepChains5 { prev: DeepChains4; }

contract DeepChainContract {
    state: DeepChains5;

    init() {
        self.state = DeepChains5{
            prev: DeepChains4{
                prev: DeepChains3{
                    prev: DeepChains2{
                        prev: DeepChains1{ inner: 2048 },
                    },
                },
            },
        };
    }
}