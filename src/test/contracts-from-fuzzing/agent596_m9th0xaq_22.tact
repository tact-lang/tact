struct NestedStructs {
    s1: Level1;
}

struct Level1 {
    s2: Level2;
}

struct Level2 {
    s3: Level3;
}

struct Level3 {
    val: Int;
    flag: Bool;
}

contract NestDeep {
    deep: NestedStructs;

    init() {
        self.deep = NestedStructs{
            s1: Level1{
                s2: Level2{
                    s3: Level3{
                        val: 5,
                        flag: true
                    }
                }
            }
        };
    }
}