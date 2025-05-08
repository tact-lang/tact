struct Level3 {
    data: Int;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
    label: String;
}

contract TestContract {
    state: Level1;

    init() {
        self.state = Level1{
            inner: Level2{
                nested: Level3{ data: 42 },
                flag: true
            },
            label: "deep"
        };
    }
}