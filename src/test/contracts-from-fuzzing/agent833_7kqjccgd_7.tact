struct Level1 { f: Bool; }
struct Level2 { l1: Level1?; }
struct Level3 { l2: Level2?; }
struct Level4 { l3: Level3?; }

contract DeepOptionals {
    data: Level4;

    init() {
        self.data = Level4{
            l3: Level3{
                l2: null
            }
        };
    }
}