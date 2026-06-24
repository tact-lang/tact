struct MultiNested {
    lvl1: Int;
    lvl2: InnerLvl2;
}

struct InnerLvl2 {
    lvl2a: Int;
    lvl3: InnerLvl3;
    flag: Bool;
}

struct InnerLvl3 {
    lvl3a: Int;
    lvl3b: Int?;
    text: String;
}

contract NestedContract {
    store: MultiNested;

    init() {
        self.store = MultiNested{
            lvl1: 10,
            lvl2: InnerLvl2{
                lvl2a: 20,
                lvl3: InnerLvl3{
                    lvl3a: 30,
                    lvl3b: null,
                    text: "nest"
                },
                flag: true
            },
        };
    }
}