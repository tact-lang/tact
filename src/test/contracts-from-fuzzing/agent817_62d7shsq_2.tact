struct DeepNested {
    n1: Level1;
}

struct Level1 {
    n2: Level2;
}

struct Level2 {
    n3: Level3;
}

struct Level3 {
    val: Int;
    flag: Bool;
    txt: String?;
}

contract TestDeep {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            n1: Level1{
                n2: Level2{
                    n3: Level3{
                        val: 123,
                        flag: true,
                        txt: "hello",
                    }
                }
            }
        };
    }
}