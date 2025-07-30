// Combining nested structs with optionals some having default null, some initialized
struct Level3 {
    c: Bool? = null;
}

struct Level2 {
    b: Int? = null;
    level3: Level3;
}

struct Level1 {
    a: Int?;
    level2: Level2;
}

contract ComplexMixInit {
    data: Level1;

    init() {
        self.data = Level1{
            a: null,
            level2: Level2{
                b: null,
                level3: Level3{}
            }
        };
    }
}