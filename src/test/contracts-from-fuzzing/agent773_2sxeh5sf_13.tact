struct Level2 {
    foo: Int;
}

struct Level1 {
    inner: Level2?;
    bar: Int;
}

contract OptStructInsideStruct {
    st: Level1 = Level1 {
        inner: null,
        bar: 5
    };

    init() {
        self.st = Level1 {
            inner: Level2{foo: 42},
            bar: 100
        };
    }

    receive() {}
}