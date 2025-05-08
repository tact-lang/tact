struct DeepNested {
    lvl2: Lvl2;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    lvl4: Lvl4;
}

struct Lvl4 {
    val: Int;
}

contract TestContract {
    myField: DeepNested;

    init() {
        self.myField = DeepNested{
            lvl2: Lvl2{
                lvl3: Lvl3{
                    lvl4: Lvl4{
                        val: 1
                    }
                }
            }
        };
    }
}