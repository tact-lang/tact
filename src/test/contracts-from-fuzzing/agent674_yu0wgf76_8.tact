struct DeeplyNestedOptional {
    a: Level1?;
}

struct Level1 {
    b: Level2?;
}

struct Level2 {
    c: Level3?;
}

struct Level3 {
    value: Int?;
}

contract TestContract {
    data: DeeplyNestedOptional;

    init() {
        self.data = DeeplyNestedOptional{
            a: Level1{
                b: Level2{
                    c: Level3{
                        value: null
                    }
                }
            }
        };
    }
}