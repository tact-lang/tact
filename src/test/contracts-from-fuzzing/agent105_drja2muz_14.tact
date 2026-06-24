struct Level3 {
    val: Int;
}

struct Level2 {
    one: Level3;
    two: Level3;
    opt: Level3?;
}

struct Level1 {
    inner: Level2;
    data: String;
}

contract TestContract {
    top: Level1?;

    init() {
        self.top = Level1{
            inner: Level2{
                one: Level3{val:1},
                two: Level3{val:2},
                opt: null
            },
            data: "hello"
        };
    }

    receive() {}
}