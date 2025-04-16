struct Level3 {
    f1: Int;
    f2: Bool?;
}

struct Level2 {
    s: Level3?;
    txt: String;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract OptionalNestedTest {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                s: null,
                txt: "hi"
            },
            flag: true
        };
    }
}