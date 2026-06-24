struct Level3 { d: Int?; }

struct Level2 { c: Level3?; }

struct Level1 { 
    a: Int;
    b: Level2?;
}

contract NullDeepAssign {
    val: Level1;

    init() {
        self.val = Level1{
            a: 1,
            b: Level2{ c: null }
        };
    }

    receive() {}
}