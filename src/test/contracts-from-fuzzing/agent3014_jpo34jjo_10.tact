struct Level3 {
    x: Int;
    y: Int;
}

struct Level2 {
    a: Bool;
    nested: Level3;
}

struct Level1 {
    flag: Bool;
    inner: Level2;
}

contract TestContract {
    val: Level1;

    init() {
        self.val = Level1{
            flag: true,
            inner: Level2{
                a: false,
                nested: Level3{ x: 5, y: 10 },
            }
        };
    }
}