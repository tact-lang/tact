struct BigNested {
    a: Int = 1;
    b: String = "b";
    c: Bool = true;
}

struct Level2 {
    d: BigNested;
    e: BigNested;
}

contract Test {
    f: Level2;
    g: BigNested;
    init() {
        self.f = Level2{ d: BigNested{}, e: BigNested{} };
        self.g = BigNested{};
    }
}