struct DeepOptionalChain {
    l1: Level1?;
}

struct Level1 {
    l2: Level2?;
}

struct Level2 {
    l3: Level3?;
}

struct Level3 {
    val: Int?;
    txt: String?;
}

contract OptDepth {
    data: DeepOptionalChain;
    init() {
        self.data = DeepOptionalChain{
            l1: Level1{
                l2: Level2{
                    l3: Level3{
                        val: 9,
                        txt: "hello"
                    }
                }
            }
        };
    }
}