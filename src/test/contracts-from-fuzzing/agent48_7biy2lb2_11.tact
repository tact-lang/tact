struct Level3 { x:Int }

struct Level2 { l3: Level3 }

struct Level1 { l2: Level2 }

contract TestContract {
    l1: Level1;
    opt: Int?;

    init() {
        self.l1 = Level1{ l2: Level2{ l3: Level3{ x: 777 } } };
        self.opt = null;
    }
}