struct DeepNested {
    l1: Level1;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    l4: Level4?;
}

struct Level4 {
    finalVal: Int;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            l1: Level1{
                l2: Level2{
                    l3: Level3{
                        l4: Level4{
                            finalVal: 999,
                        },
                    },
                },
            },
        };
    }
}
