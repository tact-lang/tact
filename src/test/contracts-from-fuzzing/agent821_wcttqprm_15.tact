// test null default in deeply nested optional setup
struct Level3 {
    num: Int?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract DeepNulls {
    val: Level1 = Level1{l2: null};

    init() {
        self.val = Level1{
            l2: Level2{
                l3: Level3{
                    num: null
                }
            }
        };
    }
}
