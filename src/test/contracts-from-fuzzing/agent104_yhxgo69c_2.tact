struct DeeplyNested {
    level1: Int;
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3;
}

struct Nested3 {
    val: Int?;
}

contract TestContract {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            level1: 1,
            level2: Nested2{
                level3: Nested3{ val: null }
            }
        };
    }
}