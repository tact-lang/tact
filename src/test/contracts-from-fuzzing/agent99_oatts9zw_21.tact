struct Level5 {
    a: Int = 5;
    b: Bool?;
}

struct Level4 {
    l5: Level5?;
    x: Int?;
}

struct Level3 {
    l4: Level4;
    txt: String = "L3";
}

struct Level2 {
    l3: Level3;
    flag: Bool = true;
}

struct Level1 {
    l2: Level2?;
    intField: Int as uint64;
}

contract StorageTest {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        l5: Level5{
                            a: 123,
                            b: false
                        },
                        x: null
                    },
                    txt: "deepL3"
                },
                flag: false
            },
            intField: 999999999999
        };
    }
}