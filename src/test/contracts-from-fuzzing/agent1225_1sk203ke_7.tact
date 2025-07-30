struct Level3 {
    prop: String;
}

struct Level2 {
    nested3: Level3;
    flag: Bool?;
}

struct Level1 {
    nested2: Level2;
    num: Int;
}

contract DeepChainNested {
    var: Level1;

    init() {
        self.var = Level1{
            nested2: Level2{
                nested3: Level3{
                    prop: "end"
                },
                flag: null
            },
            num: 123
        };
    }
}