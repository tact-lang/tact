struct MixNested {
    a: Int;
    b: OptionalsInner;
    c: Bool?;
}

struct OptionalsInner {
    x: Int?;
    y: Bool; 
    z: String?;
}

contract NestedMixContract {
    m: MixNested;

    init() {
        self.m = MixNested{
            a: 100,
            b: OptionalsInner{
                x: 12,
                y: true,
                z: null
            },
            c: null
        };
    }
}