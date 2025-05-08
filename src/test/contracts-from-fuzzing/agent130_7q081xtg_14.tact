// Structs nested deeply with mixed optional and primitive fields
struct Level4 { x: Int?; }
struct Level3 { l4: Level4; y: Bool = true; }
struct Level2 { l3: Level3; z: Int = 1; }
struct Level1 { l2: Level2; s: String = ""; }

contract TestContract {
    state: Level1;

    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{ x: null },
                    y: false
                },
                z: 99
            },
            s: "nested"
        };
    }

    receive() {
        self.state = self.state;
    }
}