struct Level3 { v: Int; }
struct Level2 { inner: Level3?; }
struct Level1 { inner: Level2?; }
contract DeepNulls {
    data: Level1?;
    init() {
        self.data = null;
    }
}
