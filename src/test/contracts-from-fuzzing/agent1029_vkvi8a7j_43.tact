struct DeepAndWide {
    val1: Int;
    val2: Int;
    level: InnerLevel;
}

struct InnerLevel {
    x: Bool;
    y: Slice;
    z: String;
}

contract DeepWideTest {
    data: DeepAndWide;
    init() {
        self.data = DeepAndWide{
            val1: 1,
            val2: 2,
            level: InnerLevel{
                x: true,
                y: emptyCell().asSlice(),
                z: "deepwide"
            }
        };
    }
}