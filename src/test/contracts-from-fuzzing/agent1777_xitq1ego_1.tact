struct DeepNested {
    a: Int;
    b: OptionalLayer;
}

struct OptionalLayer {
    x: Int?;
    y: DeeperLayer?;
}

struct DeeperLayer {
    z: Int?;
    w: String?;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 1,
            b: OptionalLayer{
                x: 2,
                y: DeeperLayer{
                    z: 3,
                    w: "hi"
                }
            }
        };
    }
}