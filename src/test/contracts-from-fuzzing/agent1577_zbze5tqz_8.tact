struct Level1 {
    value: Int;
}

struct Level2 {
    inner: Level1;
    label: String;
}

struct Level3 {
    wrap: Level2;
    flag: Bool?;
}

contract TestContract {
    nested: Level3;
    init() {
        self.nested = Level3{
            wrap: Level2{
                inner: Level1{ value: 123 },
                label: "deepest"
            },
            flag: null
        };
    }
}