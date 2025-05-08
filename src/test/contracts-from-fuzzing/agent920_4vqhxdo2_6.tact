struct DeepNested {
    inner: Level1;
}

struct Level1 {
    inner: Level2;
}

struct Level2 {
    inner: Level3;
}

struct Level3 {
    flag: Bool;
}

contract TestContract {
    nest: DeepNested;

    init() {
        self.nest = DeepNested{
            inner: Level1{
                inner: Level2{
                    inner: Level3{
                        flag: true
                    }
                }
            }
        };
    }
}