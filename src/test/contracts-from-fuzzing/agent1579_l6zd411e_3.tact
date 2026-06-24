struct Level2 {
    a: Int;
}

struct Level1 {
    nested: Level2;
    b: Bool;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{a: 5},
            b: false
        };
    }

    receive() {
        self.data.nested.a = self.data.nested.a + 1;
        self.data.b = !self.data.b;
    }
}