struct Level3 {
    c: Int;
    d: Bool;
}

struct Level2 {
    a: Int;
    b: Level3;
}

struct Level1 {
    inner: Level2;
    done: Bool;
}

contract DeepNesting {
    state: Level1;

    init() {
        self.state = Level1{
            inner: Level2{
                a: 1,
                b: Level3{
                    c: 2,
                    d: false
                }
            },
            done: true
        };
    }
}