struct DeepNested {
    bottom: Level3;
}

struct Level3 {
    sub: Level2;
    optSub: Level2?;
}

struct Level2 {
    val: Int;
    inner: Level1;
}

struct Level1 {
    flag: Bool;
    text: String;
}

contract TestDeep {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            bottom: Level3{
                sub: Level2{
                    val: 10,
                    inner: Level1{flag: false, text: "x"},
                },
                optSub: null,
            }
        };
    }
}