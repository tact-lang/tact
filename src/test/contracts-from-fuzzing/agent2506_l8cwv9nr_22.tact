struct Level2 {
    pi: Int;
    val: String?;
}

struct Level1 {
    inner: Level2;
    flag: Bool;
}

contract MidOptionalTest {
    content: Level1;
    init() {
        self.content = Level1{
            inner: Level2{
                pi: 314,
                val: null
            },
            flag: true,
        };
    }
}
