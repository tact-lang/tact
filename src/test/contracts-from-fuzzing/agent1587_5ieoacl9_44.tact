struct Level1Opt {
    l2: Level2Opt?;
}

struct Level2Opt {
    l3: Level3Opt?;
}

struct Level3Opt {
    val: Int;
}

contract OptionalNest {
    lvl1: Level1Opt;

    init(){
        self.lvl1 = Level1Opt{l2:null};
    }
}