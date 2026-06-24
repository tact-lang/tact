struct Level1 { x: Int; }
struct Level2 { l1: Level1; }
struct Level3 { l2: Level2; }
struct Level4 { l3: Level3; }

contract Chain {
    chain: Level4;

    init() {
        self.chain = Level4{
            l3: Level3{
                l2: Level2{
                    l1: Level1{ x: 900 } 
                } 
            } 
        };
    }
}