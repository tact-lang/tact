struct LayerA {
    level: Int;
}

struct LayerB {
    nestedA: LayerA;
    optVal: Bool?;
}

struct LayerC {
    nestedB: LayerB;
    flag: Bool;
    str: String;
}

contract DeepCompound {
    payload: LayerC;

    init() {
        self.payload = LayerC{
            nestedB: LayerB{ nestedA: LayerA{ level: 77 }, optVal: false },
            flag: true,
            str: "xyz"
        };
    }
}