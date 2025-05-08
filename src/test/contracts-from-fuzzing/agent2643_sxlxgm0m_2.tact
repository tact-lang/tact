struct NestedOptional {
    opt1: Level1?;
}

struct Level1 {
    opt2: Level2?;
}

struct Level2 {
    opt3: Level3?;
}

struct Level3 {
    value: Int;
}

contract TestContract {
    field: NestedOptional;

    init() {
        self.field = NestedOptional{
            opt1: Level1{
                opt2: Level2{
                    opt3: Level3{
                        value: 1
                    }
                }
            }
        };
    }
}
