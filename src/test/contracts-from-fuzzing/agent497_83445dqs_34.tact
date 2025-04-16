struct Level2 {
    foo: Int;
    bar: String;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
    x: Int;
}

contract MultiLayerFlat {
    state: Level1;

    init() {
        self.state = Level1{
            l2a: Level2{foo:1,bar:"a"},
            l2b: Level2{foo:2,bar:"b"},
            x: 42
        };
    }
}