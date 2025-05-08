struct Level2 {
    id: Int?;
    label: String?;
}

struct Level1 {
    inner: Level2?;
    name: String;
}

contract DeepNest {
    lv: Level1 = Level1{
        name: "Bob",
        inner: null
    };

    init() {
        self.lv = Level1{
            name: "Alice",
            inner: Level2{id: 5, label: null}
        };
    }
}