struct Level3 {
    q: Int?;
    r: Bool?;
}

struct Level2 {
    m: String;
    n: Level3;
}

struct Level1 {
    k: Int;
    l: Level2;
}

contract DeepNestedContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            k: 5,
            l: Level2{
                m: "deep",
                n: Level3{
                    q: 99,
                    r: false,
                }
            }
        };
    }
}