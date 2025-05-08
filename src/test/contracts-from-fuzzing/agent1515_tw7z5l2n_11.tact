struct Level3 {
    x: Int = 1;
    y: Bool = true;
}

struct Level2 {
    sub: Level3;
    name: String = "LVL2";
}

struct Level1 {
    inner: Level2;
    addr: Address?;
}

contract VeryDeep {
    root: Level1;

    init() {
        self.root = Level1{
            inner: Level2{
                sub: Level3{ x: 10, y: false },
                name: "deep",
            },
            addr: null,
        };
    }

    receive() { dump(self.root.inner.name); }
}