struct Level3 {
    val: Int;
    opt: Bool?;
}

struct Level2 {
    n1: Level3;
    n2: Level3;
}

struct Level1 {
    inner: Level2;
}

contract Test {
    state: Level1;
    init() {
        self.state = Level1{
            inner: Level2{
                n1: Level3{val: 5, opt: null},
                n2: Level3{val: 6, opt: true}
            }
        };
    }
}