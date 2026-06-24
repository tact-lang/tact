struct Level3 {
    innerValue: Int?;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract NestedContract {
    data: Level1;

    init() {
        self.data = Level1{nested: Level2{nested: Level3{innerValue: null}}};
    }
}