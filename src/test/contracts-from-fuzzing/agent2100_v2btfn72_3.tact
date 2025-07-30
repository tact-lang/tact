struct DeepNested {
    v1: Int;
    v2: Bool;
}

struct Level2 {
    nested: DeepNested;
    extra: Bool;
}

struct Level1 {
    l2: Level2;
    marker: Int;
}

contract Test {
    field: Level1;
    
    init() {
        self.field = Level1{
            l2: Level2{
                nested: DeepNested{v1: 10, v2: true},
                extra: false
            },
            marker: 100
        };
    }
}