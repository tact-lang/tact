// Deep optional chain in nested structs
struct Level3 {
    value: Int;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    nested: Level2?;
}

contract DeepOptionalChain {
    field: Level1?;

    init() {
        self.field = Level1{
            nested: null,
        };
    }
}