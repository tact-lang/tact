struct RecA {
    flag: Bool;
}

struct RecB {
    ra: RecA?;
}

struct RecC {
    rb: RecB?;
}

contract ManyNullLayers {
    store: RecC;

    init() {
        self.store = RecC{ rb: null };
    }
}