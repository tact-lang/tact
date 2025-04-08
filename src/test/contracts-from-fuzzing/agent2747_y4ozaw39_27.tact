struct SLevel1 { v: Int; }
struct SLevel2 { s: SLevel1; }
struct SLevel3 { s: SLevel2; }
struct SLevel4 { s: SLevel3; }
struct SLevel5 { s: SLevel4; }

contract NestedOptionalChain {
    chain: SLevel5?;

    init() {
        self.chain = SLevel5{
            s: SLevel4{
                s: SLevel3{
                    s: SLevel2{
                        s: SLevel1{v:99}
                    }
                }
            }
        };
    }
}