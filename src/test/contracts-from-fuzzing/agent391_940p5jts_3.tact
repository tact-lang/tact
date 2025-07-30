struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    inner: Level3;
    optionalInner: Level3?;
}

struct Level1 {
    nested: Level2;
}

contract TestContract {
    store: Level1;

    init() {
        self.store = Level1{
            nested: Level2{
                inner: Level3{ a: 10, b: true },
                optionalInner: null,
            },
        };
    }
}