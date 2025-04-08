struct Level2 {
    a: Int;
    b: Bool;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract NestedStructs {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{ a: 1, b: true },
            flag: false,
        };
    }
}