struct DeeplyNested {
    level3: Level3;
}

struct Level3 {
    value: Int;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{level3: Level3{value: 42}};
    }
}