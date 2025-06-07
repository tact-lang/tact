struct Level3 {
    a: Int?;
    b: Bool;
}

struct Level2 {
    nested: Level3;
    s: String?;
}

struct Level1 {
    deeper: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            deeper: Level2{
                nested: Level3{ a: null, b: true },
                s: "data"
            }
        };
    }
}