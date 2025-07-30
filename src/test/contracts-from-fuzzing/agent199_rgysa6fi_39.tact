struct Level3 { foo: Int?; }
struct Level2 { inner: Level3?; }
struct Level1 { core: Level2?; }

contract DeepNullOpt {
    val: Level1?;

    init() {
        self.val = null;
    }
}
