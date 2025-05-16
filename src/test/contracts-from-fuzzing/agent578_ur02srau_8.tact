struct DeepNested {
    val: Int;
    level2: Level2;
}

struct Level2 {
    num: Int;
    leaf: LeafLayer;
}

struct LeafLayer {
    txt: String;
    opt: Bool?;
}

contract DeeplyNestedStructTest {
    deep: DeepNested;
    
    init() {
        self.deep = DeepNested{
            val: 42,
            level2: Level2{
                num: 99,
                leaf: LeafLayer{
                    txt: "end",
                    opt: true
                }
            }
        };
    }
}