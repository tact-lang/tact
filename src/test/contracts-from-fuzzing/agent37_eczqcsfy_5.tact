struct LevelTwo {
    foo: Int = 1;
}

struct LevelOne {
    inner: LevelTwo = LevelTwo{};
}

contract TestContract {
    nested: LevelOne;

    init() {
        self.nested = LevelOne{};
    }

    receive() {
        dump(self.nested.inner.foo);
    }
}