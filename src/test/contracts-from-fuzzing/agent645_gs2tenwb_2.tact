struct Level3 {
    f: Int?;
}

struct Level2 {
    nested: Level3;
    b: Bool;
}

struct Level1 {
    nested: Level2;
    s: String;
}

contract TestDeeplyNested {
    v: Int = 1;
    s: Level1;

    init() {
        self.s = Level1{
            nested: Level2{
                nested: Level3{
                    f: null
                },
                b: true
            },
            s: "abc"
        };
    } 
}