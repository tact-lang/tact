struct Level3 {
    val: Int;
}

struct Level2 {
    l3: Level3;
    maybeL3: Level3?;
}

struct Level1 {
    l2: Level2;
    maybeL2: Level2?;
}

contract Deep3LayersNested {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{ val: 42 },
                maybeL3: null,
            },
            maybeL2: null,
        };
    }
}