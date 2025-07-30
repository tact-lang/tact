struct Level2 {
    f1: Int;
    f2: Bool;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{f1: 5, f2: true},
            flag: false
        };
    }
}