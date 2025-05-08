struct Level2 {
    y: Int = 123;
    flag: Bool = false;
}

struct Level1 {
    inner: Level2 = Level2{};
    text: String = "hello";
}

contract DeepNested {
    data: Level1 = Level1{};

    init() {
        self.data = Level1{
            inner: Level2{ y: 999, flag: true },
            text: "world"
        };
    }
}