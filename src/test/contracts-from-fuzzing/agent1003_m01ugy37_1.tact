struct DeeplyNested {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3?; // optional nested struct
}

struct Nested3 {
    val: Int;
}

contract TestContract {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            level1: Nested1{
                level2: Nested2{
                    level3: null
                }
            }
        };
    }
}