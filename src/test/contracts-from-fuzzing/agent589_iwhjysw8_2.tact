struct DeeplyNested {
    nest1: Level1;
}

struct Level1 {
    nest2: Level2;
}

struct Level2 {
    nest3: Level3;
}

struct Level3 {
    finalVal: String;
    flag: Bool;
}

contract NestedContract {
    state: DeeplyNested;

    init() {
        self.state = DeeplyNested{
            nest1: Level1{
                nest2: Level2{
                    nest3: Level3{
                        finalVal: "Test",
                        flag: true,
                    },
                },
            },
        };
    }
}
