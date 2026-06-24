struct OneLevel {
    a: Int;
    b: Int;
}

struct TwoLevel {
    x: OneLevel;
    y: Int;
}

struct ThreeLevel {
    t: TwoLevel;
    z: Int;
}

contract ChainStruct {
    s: ThreeLevel;

    init() {
        self.s = ThreeLevel{
            t: TwoLevel{
                x: OneLevel{a:1,b:2},
                y:3
            },
            z:4
        };
    }
}