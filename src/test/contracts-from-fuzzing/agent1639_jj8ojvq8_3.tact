struct DeepNestLevel3 {
    a: Int;
    b: Bool;
}

struct DeepNestLevel2 {
    x: DeepNestLevel3;
    y: Int?;
}

struct DeepNestLevel1 {
    p: DeepNestLevel2;
    q: String;
}

contract VeryDeepNesting {
    z: DeepNestLevel1;

    init() {
        self.z = DeepNestLevel1{
            p: DeepNestLevel2{
                x: DeepNestLevel3{
                    a: 5,
                    b: true,
                },
                y: null,
            },
            q: "deep",
        };
    }
}
