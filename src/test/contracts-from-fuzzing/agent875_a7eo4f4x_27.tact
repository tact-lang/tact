struct DeepOptionalMix {
    lv1: OptA?;
}

struct OptA {
    lv2: OptB?;
}

struct OptB {
    val: Int?;
    flag: Bool;
}

contract DeepOptionalMixTest {
    o: DeepOptionalMix;

    init() {
        self.o = DeepOptionalMix{
            lv1: OptA{
                lv2: OptB{
                    val: null,
                    flag: true
                }
            }
        };
    }
}