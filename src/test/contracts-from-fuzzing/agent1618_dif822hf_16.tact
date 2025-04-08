struct ManyNestedOptional {
    a: Level1?;
}

struct Level1 {
    b: Level2?;
}

struct Level2 {
    c: Level3?;
}

struct Level3 {
    x: Int?;
}

contract TestContract {
    data: ManyNestedOptional;

    init() {
        self.data = ManyNestedOptional{
            a: Level1{
                b: Level2{
                    c: Level3{
                        x: 5
                    }
                }
            }
        };
    }
}