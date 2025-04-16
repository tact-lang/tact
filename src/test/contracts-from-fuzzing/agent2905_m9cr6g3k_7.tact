struct Level3 { x: Int; }

struct Level2 { v: Level3; }

struct Level1 { v: Level2; }

struct Wrapper { item: Level1; }

contract FourDeepNestedStructStorage {
    root: Wrapper;
    
    init() {
        self.root = Wrapper{
            item: Level1{
                v: Level2{
                    v: Level3{ x: 42 }
                }
            }
        };
    }
}