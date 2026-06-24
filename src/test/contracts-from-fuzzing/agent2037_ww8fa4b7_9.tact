struct Level1 {
    a: Int;
    b: Bool;
    c: String?;
}

struct Level2 {
    l1a: Level1;
    l1b: Level1;
}

struct Level3 {
    l2a: Level2;
    l2b: Level2;
}

contract DeepComplex {
    root: Level3;

    init() {
        self.root = Level3{
            l2a: Level2{
                l1a: Level1{ a:1, b:true, c:null },
                l1b: Level1{ a:2, b:false, c:"x" }
            },
            l2b: Level2{
                l1a: Level1{ a:3, b:true, c:null },
                l1b: Level1{ a:4, b:false, c:"y" }
            }
        };
    }
}
