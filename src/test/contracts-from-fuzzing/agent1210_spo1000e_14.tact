struct Level3 { x: Int; }
struct Level2 { l3: Level3; y: Int; }
struct Level1 { l2: Level2; z: Int; }

contract StructChain {
    state: Level1;
    init() {
        self.state = Level1 {
            l2: Level2 {
                l3: Level3 { x: 1 },
                y: 2
            },
            z: 3
        };
    }
}