struct Proxy { x: Int; }

struct Wrapper1 { inner: Proxy; }
struct Wrapper2 { inner: Wrapper1; }
struct Wrapper3 { inner: Wrapper2; }

contract ChainWrap {
    wrap: Wrapper3;

    init() {
        self.wrap = Wrapper3{
            inner: Wrapper2{
                inner: Wrapper1{
                    inner: Proxy{ x: 33 }
                }
            }
        };
    }
}