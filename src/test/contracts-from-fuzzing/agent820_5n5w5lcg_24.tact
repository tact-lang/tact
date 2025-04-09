struct OneLevel {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Address;
}

struct TwoLevel {
    nested: OneLevel;
}

struct ThreeLevel {
    nested: TwoLevel;
}

struct FourLevel {
    nested: ThreeLevel;
}

contract TestContract {
    deeplyNested: FourLevel;
    init() {
        self.deeplyNested = FourLevel{
            nested: ThreeLevel{
                nested: TwoLevel{
                    nested: OneLevel{
                        val1: 1,
                        val2: false,
                        val3: "hi",
                        val4: myAddress(),
                    }
                }
            }
        };
    }
}