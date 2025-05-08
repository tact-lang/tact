struct Level3 {
    s: String;
}
struct Level2 {
    inner: Level3;
}
struct Level1 {
    mid: Level2;
}

contract DeepEmbed {
    field: Level1;
    init() {
        self.field = Level1{ mid: Level2{ inner: Level3{ s: "deep" } } };
    }
}