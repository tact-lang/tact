struct Level3 {
    leaf1: Int;
    leaf2: Bool;
}

struct Level2 {
    branch1: Level3;
    branch2: Level3;
}

struct Level1 {
    node1: Level2;
    node2: Level2;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            node1: Level2{
                branch1: Level3{ leaf1:1, leaf2:true },
                branch2: Level3{ leaf1:2, leaf2:false },
            },
            node2: Level2{
                branch1: Level3{ leaf1:3, leaf2:true },
                branch2: Level3{ leaf1:4, leaf2:false },
            },
        };
    }
}