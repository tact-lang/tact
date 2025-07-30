struct DeeplyNested {
    innerMost: String;
}

struct Level2 {
    nested: DeeplyNested;
}

struct Level1 {
    nested: Level2;
}

contract NestedTest {
    data: Level1;

    init() {
        self.data = Level1{nested: Level2{nested: DeeplyNested{innerMost: "hi"}}};
    }
}