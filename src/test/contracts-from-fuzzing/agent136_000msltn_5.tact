struct Level3 {
    val1: Int;
    val2: Bool;
}

struct Level2 {
    nested: Level3;
    text: String;
}

struct Level1 {
    inner: Level2;
    flag: Bool?;
}

contract DeepChain {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                nested: Level3{val1: 42, val2: true},
                text: "hello"
            },
            flag: null
        };
    }
}