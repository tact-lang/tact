struct Level3 {
    foo: Int;
    bar: Bool;
}

struct Level2 {
    baz: Level3;
    optionalL3: Level3?;
}

struct Level1 {
    inner: Level2;
    optionalInner: Level2?;
}

contract NestedStructs {
    storage: Level1;

    init() {
        self.storage = Level1{
            inner: Level2{
                baz: Level3{foo: 7, bar: true},
                optionalL3: null,
            },
            optionalInner: null,
        };
    }
}
