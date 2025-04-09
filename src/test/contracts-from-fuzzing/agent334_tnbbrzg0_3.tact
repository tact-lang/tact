struct Level3 { z: Int; }
struct Level2 { y: Level3; flag: Bool; }
struct Level1 { x: Level2; val: Int; }
contract Test {
    state: Level1;

    init() {
        self.state = Level1{
            x: Level2{
                y: Level3{ z: 5 },
                flag: false
            },
            val: 100
        };
    }
}