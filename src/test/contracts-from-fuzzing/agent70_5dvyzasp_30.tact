struct Level1 {
    a: Int;
    l2: Level2;
}

struct Level2 {
    b: Int?;
    l3: Level3?;
}

struct Level3 {
    c: Bool;
}

contract C {
    d: Level1;

    init() {
        self.d = Level1{
            a:1,
            l2: Level2{
                b:null,
                l3:null
            }
        };
    }
}