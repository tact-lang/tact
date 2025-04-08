struct Level3 {
    a: Int;
}

struct Level2 {
    mid: Level3;
    name: String;
}

struct Level1 {
    top: Level2;
    active: Bool;
}

contract DeepNestedContract {
    record: Level1;

    init() {
        self.record = Level1{
            top: Level2{
                mid: Level3{ a: 7 },
                name: "Deep"
            },
            active: true
        };
    }
}