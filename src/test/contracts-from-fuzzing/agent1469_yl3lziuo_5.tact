struct Level3 {
    z: Bool;
}

struct Level2 {
    y: Level3;
    x: Int;
}

struct Level1 {
    inner: Level2;
    foo: String;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            inner: Level2{
                y: Level3{ z: true },
                x: 99
            },
            foo: "ok"
        };
    }

    receive() {}
}