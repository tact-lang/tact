struct DeepStruct {
    lvl1: Lvl1;
}

struct Lvl1 {
    lvl2: Lvl2;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    lvl4: Lvl4;
}

struct Lvl4 {
    x: Int;
    y: Int;
    s: String;
}

contract DeepTree {
    root: DeepStruct;
    init() {
        self.root = DeepStruct{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    lvl3: Lvl3{
                        lvl4: Lvl4{ x: 1, y: 2, s: "deep" }
                    }
                }
            }
        };
    }
}