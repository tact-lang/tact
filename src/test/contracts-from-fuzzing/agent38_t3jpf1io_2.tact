struct DeepNestLevel3 {
    a: Int;
    b: Bool;
}

struct DeepNestLevel2 {
    x: DeepNestLevel3;
    y: Int;
}

struct DeepNestLevel1 {
    z: DeepNestLevel2;
    w: Bool;
}

contract DeepNestingTest {
    payload: DeepNestLevel1;

    init() {
        self.payload = DeepNestLevel1{
            z: DeepNestLevel2{
                x: DeepNestLevel3{
                    a: 1,
                    b: false,
                },
                y: 2,
            },
            w: true,
        };
    }
}