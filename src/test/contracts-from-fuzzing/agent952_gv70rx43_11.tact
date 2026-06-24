struct InnerLevel4 { val4: Int; }
struct InnerLevel3 { val3: Int; l4: InnerLevel4; }
struct InnerLevel2 { val2: Int; l3: InnerLevel3; }
struct InnerLevel1 { val1: Int; l2: InnerLevel2; }

contract Test {
    superdeep: InnerLevel1;

    init() {
        self.superdeep = InnerLevel1{
            val1:1,
            l2: InnerLevel2{
                val2:2,
                l3: InnerLevel3{
                    val3:3,
                    l4: InnerLevel4{val4:4}
                }
            }
        };
    }
}
