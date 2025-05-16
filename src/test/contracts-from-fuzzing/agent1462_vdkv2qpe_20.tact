// Mixing optionals in nested structs
struct Level1 {
    a: Int?;
}
struct Level2 {
    l1: Level1?;
}

contract NestedOpts {
    f: Level2;

    init() {
        self.f = Level2{ l1: null };
    }
}