struct Level {
    val: Int;
    flag: Bool;
}

contract Duplicates {
    one: Level;
    two: Level;

    init() {
        self.one = Level{ val: 1, flag: true };
        self.two = Level{ val: 2, flag: false };
    }
}