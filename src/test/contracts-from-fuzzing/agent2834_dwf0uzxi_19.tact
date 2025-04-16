struct InnerMost {
    foo: Int;
}

struct Level2 {
    inner: InnerMost?;
}

struct Level1 {
    nested: Level2?;
}

contract OptOptInner {
    store: Level1;

    init() {
        self.store = Level1{
            nested: null
        };
    }
}