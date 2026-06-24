struct Layer3 {
    z: Bool;
}

struct Layer2 {
    y: Layer3?;
}

struct Layer1 {
    x: Layer2?;
}

contract OptionalDeep {
    optDeep: Layer1;

    init() {
        self.optDeep = Layer1{
            x: Layer2{
                y: null
            }
        };
    }
}