struct Level3 {
    leaf: Int;
}

struct Level2 {
    inner: Level3;
    optInner: Level3?;
}

struct Level1 {
    mid: Level2;
    optMid: Level2?;
}

contract DeepNestedTest {
    data: Level1;
    
    init() {
        self.data = Level1{
            mid: Level2{
                inner: Level3{leaf: 42},
                optInner: null
            },
            optMid: null
        };
    }
}