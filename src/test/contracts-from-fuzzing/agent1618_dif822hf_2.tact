struct DeepNested {
    nest1: Level1;
}

struct Level1 {
    nest2: Level2;
}

struct Level2 {
    nest3: Level3;
}

struct Level3 {
    value: Int;
    opt: Bool?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            nest1: Level1{
                nest2: Level2{
                    nest3: Level3{
                        value: 42,
                        opt: null
                    }
                }
            }
        };
    }
}