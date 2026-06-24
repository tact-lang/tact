struct LevelA {
    foo: Int;
    bar: Bool?;
}

struct LevelB {
    baz: LevelA?;
    qux: Bool;
}

contract OptionalEmbedded {
    state: LevelB;
    init() {
        self.state = LevelB{
            baz: null,
            qux: true
        };
    }
}