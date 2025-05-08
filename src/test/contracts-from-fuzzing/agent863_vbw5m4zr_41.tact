struct DeeplyNested {
    lvl1: Int;
    lvl2: Inner1;
}

struct Inner1 {
    lvl3: Int;
    lvl4: Inner2;
}

struct Inner2 {
    lvl5: Int;
}

contract DeepTree {
    root: DeeplyNested;

    init() {
        self.root = DeeplyNested{
            lvl1: 1,
            lvl2: Inner1{
                lvl3: 3,
                lvl4: Inner2{ lvl5: 5 }
            }
        };
    }
}