struct Level3 {
    x: Int;
    y: Bool;
}

struct Level2 {
    sub: Level3;
    val: String;
}

struct Level1 {
    deep: Level2;
    flag: Bool;
}

contract DeepNestTest {
    data: Level1;
    init() {
        self.data = Level1{
            deep: Level2{
                sub: Level3{x: 5, y: true},
                val: "hello"
            },
            flag: false
        };
    }
}