struct Level3 {
    val: Int;
    flag: Bool;
    text: String;
}

struct Level2 {
    inner: Level3;
    more: Int;
}

struct Level1 {
    nested: Level2;
    number: Int;
}

contract DeepStructTest {
    field: Level1;

    init() {
        self.field = Level1{
            nested: Level2{
                inner: Level3{
                    val: 7,
                    flag: true,
                    text: "abc"
                },
                more: 5
            },
            number: 42
        };
    }
}