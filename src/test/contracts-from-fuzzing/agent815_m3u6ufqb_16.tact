struct Level3 {
    x: Int;
    y: String;
}

struct Level2 {
    l3: Level3;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
    opt: Int?;
}

contract NestedStructsWithOptionals {
    state: Level1;

    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{ x: 42, y:"hi" },
                flag: true
            },
            opt: null
        };
    }
}