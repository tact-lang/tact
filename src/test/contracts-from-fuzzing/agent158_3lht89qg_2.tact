struct DeeplyNested {
    foo: Level1;
}

struct Level1 {
    bar: Level2;
}

struct Level2 {
    baz: Level3;
}

struct Level3 {
    qux: Level4;
}

struct Level4 {
    spam: Int;
}

contract VeryDeepNest {
    value: DeeplyNested;
    init() {
        self.value = DeeplyNested{
            foo: Level1{
                bar: Level2{
                    baz: Level3{
                        qux: Level4{
                            spam: 42
                        }
                    }
                }
            }
        };
    }
}