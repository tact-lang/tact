struct InnerLevel3 {
    z: Int?;
}

struct InnerLevel2 {
    y: InnerLevel3;
}

struct InnerLevel1 {
    x: InnerLevel2;
}

contract DeepNestingThreeLayers {
    root: InnerLevel1;

    init() {
        self.root = InnerLevel1{
            x: InnerLevel2{
                y: InnerLevel3{
                    z: null,
                },
            },
        };
    }
}