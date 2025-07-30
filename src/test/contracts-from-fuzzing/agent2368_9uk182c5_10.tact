struct RecA {
    valA: Int;
}

struct RecB {
    valB: Int;
}

struct Container {
    itemA: RecA;
    optB: RecB?;
}

contract OptStructSwitch {
    storage: Container;

    init() {
        self.storage = Container{
            itemA: RecA{ valA: 10 },
            optB: null
        };
    }
}