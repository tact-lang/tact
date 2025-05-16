struct Level3 {
    val: Int;
    text: String;
}

struct Level2 {
    optL3: Level3?;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
    number: Int;
}

contract OptionalNest {
    data: Level1;
    init() {
        self.data = Level1{
            inner: Level2{
                optL3: null,
                flag: true
            },
            number: 123
        };
    }
}