message(0x55556666) MsgInner {
    x: Int;
}

struct Level3 {
    m: MsgInner?;
    txt: String;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2;
}

contract ComplexNested {
    state: Level1;

    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{
                    m: MsgInner{ x: 42 },
                    txt: "deep"
                }
            }
        };
    }
}
