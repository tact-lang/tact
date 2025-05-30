struct SLevel3 { z: Int?; s: String; }
struct SLevel2 { nested: SLevel3?; }
struct SLevel1 { nested2: SLevel2?; }

contract DeepOptMix {
    level1: SLevel1;
    init() {
        self.level1 = SLevel1{
            nested2: SLevel2{
                nested: SLevel3{
                    z: null,
                    s: "abc",
                },
            },
        };
    }
}