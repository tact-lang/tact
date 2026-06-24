struct OneLevel {
    x: Int;
}

struct TwoLevel {
    one: OneLevel;
}

struct ThreeLevel {
    two: TwoLevel;
}

contract NestedChain {
    big: ThreeLevel;

    init() {
        self.big = ThreeLevel{
            two: TwoLevel{
                one: OneLevel{ x:999 }
            }
        };
    }
}
