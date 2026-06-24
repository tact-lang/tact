struct Level3 {
    id: Int;
    label: String;
    desc: String?;
}

struct Level2 {
    nested: Level3;
}

contract NestedStructsOpt {
    data: Level2;

    init() {
        self.data = Level2{
            nested: Level3{ id: 10, label: "L3", desc: null }
        };
    }
}
