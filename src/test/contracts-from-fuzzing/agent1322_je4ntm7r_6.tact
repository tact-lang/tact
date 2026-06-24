struct NestedOptionals {
    a: Level2?;
}

struct Level2 {
    b: Level3?;
}

struct Level3 {
    c: Int?;
}

contract TestNestedOptionals {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            a: Level2{
                b: Level3{
                    c: 123
                }
            }
        };
    }
}