struct DeeplyNested {
    a: Int;
    b: Int?;
}

struct Level2 {
    c: DeeplyNested;
    d: Int;
}

struct Level1 {
    e: Int;
    f: Level2;
}

contract DeepNestTest {
    record: Level1;
    
    init() {
        self.record = Level1{
            e: 1,
            f: Level2{
                c: DeeplyNested{ a: 2, b: null },
                d: 3
            }
        };
    }
}