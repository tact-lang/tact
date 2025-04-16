struct Level2 {
    a: Int;
    b: Bool?;
}

struct Level1 {
    foo: Int?;
    nested: Level2;
}

contract MixedInit {
    data: Level1;

    init() {
        self.data = Level1{
            foo: null,
            nested: Level2{
                a: 5,
                b: null,
            },
        };
    }
}