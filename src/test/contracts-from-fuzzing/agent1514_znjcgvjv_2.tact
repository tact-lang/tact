struct Level3 {
    flag: Bool;
}

struct Level2 {
    val: Int;
    nested: Level3;
}

struct Level1 {
    text: String;
    next: Level2;
}

contract DeeplyNestedStructTest {
    data: Level1;

    init() {
        self.data = Level1{
            text: "hello",
            next: Level2{
                val: 10,
                nested: Level3{ flag: true }
            }
        };
    }
}