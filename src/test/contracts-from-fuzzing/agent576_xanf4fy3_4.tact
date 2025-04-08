struct Level3 { x: Int; }

struct Level2 { l3: Level3; y: Int; }

struct Level1 { l2Opt: Level2?; z: Int; }

contract DeepChain {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2Opt: null,
            z: 5
        };
    }
}
