struct Level3 { leaf1: Int; leaf2: String; }

struct Level2 { node: Level3; flag: Bool; }

struct Level1 { root: Level2; desc: String; }

contract DeepNestedContract {
    data: Level1;

    init() {
        self.data = Level1{
            root: Level2{
                node: Level3{ leaf1: 1, leaf2: "a" },
                flag: true
            },
            desc: "deep"
        };
    }
}