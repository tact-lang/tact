struct Level3 {
    xx: Int;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract OptDeep {
    val: Level1;

    init() {
        self.val = Level1{l2: null};
    }
}