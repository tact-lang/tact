struct OneLevel {
    x: Int;
}

struct TwoLevel {
    inner1: OneLevel;
    inner2: OneLevel;
    optInner: OneLevel?;
    flag: Bool;
}

struct ThreeLevel {
    nest: TwoLevel;
    nest2: TwoLevel;
    flag2: Bool;
}

contract DeepWide {
    state: ThreeLevel;

    init() {
        self.state = ThreeLevel{
            nest: TwoLevel{
                inner1: OneLevel{ x:1 },
                inner2: OneLevel{ x:2 },
                optInner: null,
                flag: false
            },
            nest2: TwoLevel{
                inner1: OneLevel{ x:3 },
                inner2: OneLevel{ x:4 },
                optInner: null,
                flag: true
            },
            flag2: true
        };
    }
}
