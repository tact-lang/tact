struct HugeNest1 { f: Int; }
struct HugeNest2 { f: HugeNest1; }
struct HugeNest3 { f: HugeNest2; }
struct HugeNest4 { f: HugeNest3; }
struct HugeNest5 { f: HugeNest4; }
struct HugeNest6 { f: HugeNest5; }

contract SixLayers {
    val: HugeNest6;

    init() {
        self.val = HugeNest6{
            f: HugeNest5{
                f: HugeNest4{
                    f: HugeNest3{
                        f: HugeNest2{
                            f: HugeNest1{f: 999}
                        }
                    }
                }
            }
        };
    }
}