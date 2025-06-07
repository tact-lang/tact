struct OptionalDeep {
    field: Level1?;
}

struct Level1 {
    l2: Level2?;
}

struct Level2 {
    l3: Level3?;
}

struct Level3 {
    x: Int?;
}

contract TestContract {
    payload: OptionalDeep;
    init() {
        self.payload = OptionalDeep{};
    }
    receive() {}
}