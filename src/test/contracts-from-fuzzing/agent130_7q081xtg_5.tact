// Same test using named structs instead of inline structs
struct Level4 {
    flag: Bool = true;
}

struct Level3 {
    lvl4: Level4;
}

struct Level2 {
    lvl3: Level3;
}

struct DeepNested {
    lvl1: Int = 1;
    lvl2: Level2;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            lvl1: 123,
            lvl2: Level2{
                lvl3: Level3{
                    lvl4: Level4{
                        flag: false
                    }
                }
            }
        };
    }

    receive() {
        self.val = self.val;
    }
}