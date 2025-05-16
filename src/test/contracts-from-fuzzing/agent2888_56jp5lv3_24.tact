// long nested struct chain mix optional/default
struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    l3: Level3?;
    s: String = "hi";
}

struct Level1 {
    l2: Level2;
}

contract NestMix {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: null,
            },
        };
    }
}