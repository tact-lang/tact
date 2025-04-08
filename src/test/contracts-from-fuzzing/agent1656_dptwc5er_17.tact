struct OneLevel {
    a: Int;
}

struct TwoLevel {
    nested: OneLevel;
}

struct ThreeLevel {
    nested: TwoLevel;
}

contract DeepLevelsTest {
    data: ThreeLevel;

    init() {
        self.data = ThreeLevel{
            nested: TwoLevel{
                nested: OneLevel{
                    a: 123
                }
            }
        };
    }
}
