struct DeepNested {
    nesting: Level2;
}

struct Level2 {
    inner: Level3;
}

struct Level3 {
    flag: Bool;
    val: Int;
    opt: Int?;
}

contract DeepStorage {
    state: DeepNested;
    
    init() {
        self.state = DeepNested{
            nesting: Level2{
                inner: Level3{
                    flag: false,
                    val: 999,
                    opt: null,
                }
            }
        };
    }
}