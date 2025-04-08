struct Level3 { f: Int }

struct Level2 { l3: Level3 }

struct Level1 { l2: Level2 }

contract Test6 {
    deep: Level1;

    init() {
        self.deep = Level1{
            l2: Level2{
                l3: Level3{ f: 999 }
            }
        };
    }
}