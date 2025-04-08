// test contract with deeply nested opt struct inside opt struct
struct Level1 {
    a: Int;
}

struct Level2 {
    l1: Level1?;
}

struct Level3 {
    l2: Level2?;
}

contract DeepOptNest {
    deep: Level3?;
    
    init() {
        self.deep = null;
    }
}
