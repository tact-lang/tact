struct Level2 {
    leaf: Int;
}

struct Level1 {
    nested1: Level2?;
    nested2: Level2?;
}

contract OptSiblings {
    root: Level1;

    init() {
        self.root = Level1{nested1:null,nested2:null};
    }
}
