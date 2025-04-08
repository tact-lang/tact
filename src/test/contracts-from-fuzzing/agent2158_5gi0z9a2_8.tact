struct Level3 {
    deep: Int;
    note: String;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
    text: String;
}

contract Deep3LevelNestTest {
    val: Level1;

    init() {
        self.val = Level1{
            inner: Level2{
                inner: Level3{
                    deep: 999,
                    note: "deepest"
                },
                flag: true
            },
            text: "root"
        };
    }
}