struct DeepLvl3 {
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
    y: Bool;
    z: String;
}

contract TestContract {
    data: DeepLvl3;

    init() {
        self.data = DeepLvl3{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    lvl3: Lvl3{
                        x: 42,
                        y: true,
                        z: "ok",
                    },
                },
            },
        };
    }
}
