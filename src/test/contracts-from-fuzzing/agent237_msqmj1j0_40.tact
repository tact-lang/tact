struct Level3 {
    s: String;
}

struct Level2 {
    nest: Level3;
}

struct Level1 {
    nest: Level2;
}

contract NestedStrings {
    data: Level1;
    init() {
        self.data = Level1{nest: Level2{nest: Level3{s: "deep"}}};
    }
}