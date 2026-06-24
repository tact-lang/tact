struct Level3 {
    number: Int;
}

struct Level2 {
    maybeInner: Level3?;
}

struct Level1 {
    second: Level2;
}

contract TripleNesting {
    data: Level1 = Level1{
        second: Level2{maybeInner: null}
    };
    
    init() {
        self.data = Level1{second: Level2{maybeInner: Level3{number: 999}}};
    }
}