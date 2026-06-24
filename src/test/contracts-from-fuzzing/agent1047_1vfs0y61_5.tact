struct DeepOptional {
    level1: Int?;
    level2: Bool?;
    level3: String?;
}

struct Wrapper {
    nested: DeepOptional?;
}

contract Test {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            nested: null
        };
    }
}