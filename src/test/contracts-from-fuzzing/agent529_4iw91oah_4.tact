struct Level3 {
    val1: Int;
    optVal: String?;
}

struct Level2 {
    number: Int;
    l3: Level3;
}

struct Level1 {
    flag: Bool;
    l2: Level2;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            flag: true,
            l2: Level2{
                number: 42,
                l3: Level3{ val1: 9, optVal: null }
            }
        };
    }
}