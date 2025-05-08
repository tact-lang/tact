struct Level3 { x: Int?; y: String; }
struct Level2 { l3a: Level3; l3b: Level3; flag: Bool; }
struct Level1 { l2: Level2; z: Int; }

contract MultiDepth {
    store: Level1;

    init() {
        self.store = Level1{
            l2: Level2{
                l3a: Level3{ x:null, y:"A" },
                l3b: Level3{ x:42, y:"B" },
                flag: true
            },
            z: 10
        };
    }
}