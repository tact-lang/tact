// Nested structs with optional inner layers
struct Level3 { v: Int; }

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    inner: Level2?;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                inner: null,
            },
        };
    }
}