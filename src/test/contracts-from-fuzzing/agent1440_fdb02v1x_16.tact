struct DeeplyNested {
    x1: Int;
    l1: Level1;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

struct Level2 {
    val: Int;
    l3: Level3;
}

struct Level3 {
    ok: Bool;
    s: String;
}

contract DeepNestStore {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            x1: 42,
            l1: Level1{
                l2: Level2{
                    val: 7,
                    l3: Level3{ ok: false, s: "xx" }
                },
                flag: true
            }
        };
    }
}