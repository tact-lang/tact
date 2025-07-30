struct Level3 {
    val: Int;
}

struct Level2 {
    child: Level3;
}

struct Level1 {
    child: Level2;
}

contract DeepOptional {
    opt: Level1?;

    init() {
        self.opt = Level1{
            child: Level2{
                child: Level3{ val: 77 }
            }
        };
    }
}