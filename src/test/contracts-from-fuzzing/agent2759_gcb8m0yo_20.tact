struct Layer1 {
    x: Int;
    y: Bool;
}

struct Layer2 {
    a: Layer1;
    b: Bool?;
}

struct Layer3 {
    mid: Layer2?;
    endVal: Int;
}

contract OptionalDeepNest {
    f: Layer3;

    init() {
        self.f = Layer3{
            mid: null,
            endVal: 42
        };
    }
}