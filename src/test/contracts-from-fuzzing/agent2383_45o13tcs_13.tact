struct Level4 {
    data: String;
}

struct Level3 {
    l4: Level4;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract FourLayers {
    nestedField: Level1;
    init() {
        self.nestedField = Level1 { l2: Level2 { l3: Level3 { l4: Level4 { data: "end" } } } };
    }
}