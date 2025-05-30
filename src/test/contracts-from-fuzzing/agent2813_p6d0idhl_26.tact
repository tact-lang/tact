struct DeepDefaults {
    p1: Int = 1;
    p2: MidLevel;
}

struct MidLevel {
    p3: Int = 3;
    p4: LeafLevel;
}

struct LeafLevel {
    p5: Bool = true;
    p6: String = "abc";
}

contract TestDeepDefaults {
    s: DeepDefaults;
    init() {
        self.s = DeepDefaults{
            p2: MidLevel{
                p4: LeafLevel{}
            }
        };
    }
}
