struct Level1 {
    f1: Int;
}
struct Level2 {
    f2: Level1;
}
struct Level3 {
    f3: Level2;
}
struct Level4 {
    f4: Level3;
}

contract OptionalMidLayer {
    optFld: Level3?;

    init() {
        self.optFld = null;
    }
}