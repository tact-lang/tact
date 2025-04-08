struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    nested: Level3;
    optionalNested: Level3?;
}

struct Level1 {
    deepNested: Level2;
    optionalDeepNested: Level2?;
}

contract MultiLayer {
    data: Level1;

    init() {
        self.data = Level1{
            deepNested: Level2{
                nested: Level3{ a: 5, b: null },
                optionalNested: null
            },
            optionalDeepNested: null
        };
    }
}