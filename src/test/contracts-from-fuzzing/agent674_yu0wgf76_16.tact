struct Level3 {
    a: Int?;
    b: Bool;
}

struct Level2 {
    one: Int;
    sub: Level3?;
}

struct Level1 {
    x: Level2?;
    y: Int;
}

contract ComboTest {
    content: Level1;

    init() {
        self.content = Level1{
            x: Level2{
                one: 123,
                sub: Level3{
                    a: null,
                    b: false
                }
            },
            y: 321
        };
    }
}