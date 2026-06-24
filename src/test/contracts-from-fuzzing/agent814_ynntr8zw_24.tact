// deep optional chain in a contract persistent field
struct D2 { value: Int; }
struct D1 { inner: D2?; }
struct D0 { inner: D1?; }

contract DeepOptionChain {
    root: D0;

    init() {
        self.root = D0{
            inner: D1{
                inner: D2{
                    value: 42
                }
            }
        };
    }
}
