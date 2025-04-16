struct Level2 {
    foo: Int;
    bar: Bool;
}

struct Level1 {
    nested: Level2;
    text: String;
}

contract DeepNested {
    data: Level1 = Level1{
        nested: Level2{foo: 77, bar: true},
        text: "deep"
    };

    init() {
        self.data = Level1{
            nested: Level2{foo: 11, bar: false},
            text: "updated"
        };
    }
}
