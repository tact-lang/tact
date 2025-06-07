struct DeepNested {
    lvl1: Lvl1;
}

struct Lvl1 {
    lvl2: Lvl2;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    x: Int;
    y: Bool?;
}

contract DeepTest {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    lvl3: Lvl3{
                        x: 5,
                        y: true
                    }
                }
            }
        };
    }
}