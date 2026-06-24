struct DeeplyNested {
    lvl1: Int;
    lvl2: Inner2;
}

struct Inner2 {
    lvl2_1: Int;
    lvl3: Inner3;
}

struct Inner3 {
    lvl3_1: Int;
    lvl4: Inner4;
}

struct Inner4 {
    lvl4_1: Bool;
    lvl5: Inner5;
}

struct Inner5 {
    last: Int?;
}

contract VeryDeep {
    x: DeeplyNested;

    init() {
        self.x = DeeplyNested{
            lvl1: 10,
            lvl2: Inner2{
                lvl2_1: 20,
                lvl3: Inner3{
                    lvl3_1: 30,
                    lvl4: Inner4{
                        lvl4_1: true,
                        lvl5: Inner5{
                            last: null
                        }
                    }
                }
            }
        };
    }
}