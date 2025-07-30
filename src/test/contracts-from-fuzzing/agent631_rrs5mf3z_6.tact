struct Level3 {
    innerInt: Int;
    innerStr: String;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract Test {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2a: Level2{
                l3a: Level3{ innerInt: 1, innerStr: "a" },
                l3b: Level3{ innerInt: 2, innerStr: "b" },
            },
            l2b: Level2{
                l3a: Level3{ innerInt: 3, innerStr: "c" },
                l3b: Level3{ innerInt: 4, innerStr: "d" },
            }
        };
    }
}