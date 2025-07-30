struct Level3 { a: Int; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            l2: Level2{
                l3: Level3{ a: 5 }
            }
        };
    }
}