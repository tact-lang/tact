struct Level4 {
    val: Int;
}

struct Level3 {
    l4: Level4;
    flag: Bool;
}

struct Level2 {
    l3: Level3;
    s: String;
}

struct Level1 {
    l2: Level2;
    note: String?;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        val: 99,
                    },
                    flag: true,
                },
                s: "deep value",
            },
            note: null,
        };
    }
}
