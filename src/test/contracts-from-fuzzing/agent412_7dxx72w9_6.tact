struct Level3 {
    o1: Int?;
    o2: String?;
    o3: Bool?;
}

struct Level2 {
    inner1: Level3?;
    inner2: Level3?;
    flag: Bool;
}

struct Level1 {
    branch1: Level2?;
    branch2: Level2?;
    note: String;
}

contract ComplexTree {
    root: Level1 = Level1{
        branch1: null,
        branch2: null,
        note: "root"
    };

    receive() {
        let _ = self.root.branch1;
    }
}