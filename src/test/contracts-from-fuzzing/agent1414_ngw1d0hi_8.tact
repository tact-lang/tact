struct InnerMost {
    a: Int;
    b: Bool;
}

struct Level2 {
    c: InnerMost;
    d: Bool?;
}

struct Level1 {
    e: Level2;
    str: String;
}

contract ComboNestOpt {
    state: Level1;

    init() {
        self.state = Level1{
            e: Level2{
                c: InnerMost{ a: 1, b: true },
                d: null
            },
            str: "test"
        };
    }
}