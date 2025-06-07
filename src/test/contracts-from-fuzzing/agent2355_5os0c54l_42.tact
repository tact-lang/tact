struct ManyNestedStr {
    s: Level1;
}

struct Level1 {
    s: Level2;
}

struct Level2 {
    s: Level3;
}

struct Level3 {
    s: Level4;
}

struct Level4 {
    val: String;
}

contract DeepStrings {
    f: ManyNestedStr;

    init() {
        self.f = ManyNestedStr{
            s: Level1{
                s: Level2{
                    s: Level3{
                        s: Level4{
                            val: "hello"
                        }
                    }
                }
            }
        };
    }
}