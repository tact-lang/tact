struct Level3 { leaf: Int; }

struct Level2 {
    node: Level3;
    active: Bool;
}

struct Level1 {
    branch: Level2;
    name: String;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            branch: Level2{
                node: Level3{ leaf: 123 },
                active: true
            },
            name: "Deep nested"
        };
    }
}