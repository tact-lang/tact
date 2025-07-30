struct Level4 {
    val: Int;
}

struct Level3 {
    child: Level4;
}

struct Level2 {
    child: Level3;
}

struct Level1 {
    child: Level2;
}

contract FourNested {
    root: Level1;

    init() {
        self.root = Level1{ child: Level2{ child: Level3{ child: Level4{ val: 7 } } } };
    }
}