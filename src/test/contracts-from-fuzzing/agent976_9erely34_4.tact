struct Level2 {
    z: Int?;
}

struct Level1 {
    inner: Level2;
}

contract DeepOptional {
    nested: Level1;
    init() {
        self.nested = Level1{ inner: Level2{} };
    }
}