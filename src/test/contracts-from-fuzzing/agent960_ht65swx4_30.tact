struct Level3 {
    value: Int? = null;
}
struct Level2 {
    inner: Level3 = Level3{};
}
struct Level1 {
    inner: Level2 = Level2{};
}
contract NestedDefaults {
    data: Level1;
    init() {
        self.data = Level1{};
    }
}