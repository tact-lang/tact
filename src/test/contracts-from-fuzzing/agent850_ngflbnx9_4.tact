struct Level3 {
    f: Bool;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract UltraNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{f: true}
            }
        };
    }
}
