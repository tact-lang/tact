struct MultiNested {
    lvl1: Lvl1;
}

struct Lvl1 {
    lvl2: Lvl2;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    val: Int?;
    str: String?;
    flag: Bool?;
}

contract DeepMultiOpt {
    data: MultiNested;
    init() {
        self.data = MultiNested{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    lvl3: Lvl3{
                        val: null,
                        str: null,
                        flag: null,
                    },
                },
            },
        };
    }
}