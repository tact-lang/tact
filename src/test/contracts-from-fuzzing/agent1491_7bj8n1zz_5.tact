struct Level3 { leaf: Bool }
struct Level2 { child: Level3 }
struct Level1 { root: Level2 }

contract TestContract {
    state: Level1;
    init() {
        self.state = Level1 {
            root: Level2 {
                child: Level3 {
                    leaf: true
                }
            }
        };
    }
}