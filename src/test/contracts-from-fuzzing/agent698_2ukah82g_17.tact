struct Level3 { val: Int; }
struct Level2 { l3: Level3; opt: Bool?; }
struct Level1 { l2: Level2; }

contract TestContract {
    s: Level1;

    init() {
        self.s = Level1{
            l2: Level2{
                l3: Level3{ val: 123 },
                opt: null
            }
        };
    }
}