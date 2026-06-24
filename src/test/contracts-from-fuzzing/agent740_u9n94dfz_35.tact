contract StructInStructManyLevels {
    a: Wrapper;

    init() {
        self.a = Wrapper {
            inner: Level1 {
                value: 99
            }
        };
    }
}

struct Wrapper {
    inner: Level1;
}

struct Level1 {
    value: Int;
}