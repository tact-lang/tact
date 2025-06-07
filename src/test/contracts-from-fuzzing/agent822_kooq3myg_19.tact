// initialize deeply nested structs with optional fields
struct Level3 { val: Int?; }
struct Level2 { inner: Level3; }
struct Level1 { in2: Level2; }

contract TestContract {
    d: Level1;

    init() {
        self.d = Level1{ in2: Level2{ inner: Level3{ val: null } } };
    }
}
