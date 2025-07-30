struct DeeplyNestedComplex {
    inner1: Int?;
    inner2: String?;
    inner3: Bool?;
}

struct MiddleLayer {
    nested: DeeplyNestedComplex;
    val: Int;
}

struct TopLayer {
    m: MiddleLayer;
    flag: Bool;
}

contract MultiNestedTest {
    storage: TopLayer;

    init() {
        self.storage = TopLayer{
            m: MiddleLayer{
                nested: DeeplyNestedComplex{ inner1:null, inner2:null, inner3:null },
                val: 999
            },
            flag: true
        };
    }
}
