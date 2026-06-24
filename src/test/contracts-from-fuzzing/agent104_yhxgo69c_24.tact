struct OneLevel {
    value: Int;
}

struct TwoLevel {
    inner: OneLevel;
}

struct ThreeLevel {
    nested: TwoLevel;
}

contract TestContract {
    s: ThreeLevel;
    init() {
        self.s = ThreeLevel{
            nested: TwoLevel{
                inner: OneLevel{ value: 99 }
            }
        };
    }
}