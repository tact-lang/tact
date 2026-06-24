struct DeepNestLevel3 {
    x: Bool;
}

struct DeepNestLevel2 {
    y: Int;
    next: DeepNestLevel3;
}

struct DeepNestLevel1 {
    z: String;
    next: DeepNestLevel2;
}

contract DeepNestTest {
    root: DeepNestLevel1;

    init() {
        self.root = DeepNestLevel1{
            z: "hello",
            next: DeepNestLevel2 {
                y: 42,
                next: DeepNestLevel3 {
                    x: true
                }
            }
        };
    }
}