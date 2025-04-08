struct InnerMost { val: Int; }

struct Wrapper1 { nest: InnerMost; }
struct Wrapper2 { nest2: Wrapper1; }
struct Wrapper3 { nest3: Wrapper2; }

contract ChainWrap {
    chain: Wrapper3;
    init() {
        self.chain = Wrapper3{
            nest3: Wrapper2{
                nest2: Wrapper1{
                    nest: InnerMost{val:123}
                }
            }
        };
    }
}