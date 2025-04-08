struct DeeplyNested1 { a: Int; }
struct DeeplyNested2 { dn1: DeeplyNested1; }
struct DeeplyNested3 { dn2: DeeplyNested2; }
struct DeeplyNested4 { dn3: DeeplyNested3; }
struct DeeplyNested5 { dn4: DeeplyNested4; }

contract DeepNestTest {
    val: DeeplyNested5;
    init() {
        self.val = DeeplyNested5{
            dn4: DeeplyNested4{
                dn3: DeeplyNested3{
                    dn2: DeeplyNested2{
                        dn1: DeeplyNested1{
                            a: 42
                        }
                    }
                }
            }
        };
    }
}
