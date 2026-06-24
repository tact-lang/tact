struct Layer3 {
    a: Int = 1;
    b: Bool = true;
}

struct Layer2 {
    x: Int = 11;
    y: Bool;
    z: Layer3; // has defaults
}

struct Layer1 {
    f: Int;
    g: Layer2; // partially defaults
}

contract DeepDefaultsPartial {
    data: Layer1;

    init() {
        self.data = Layer1{
            f: 100,
            g: Layer2{
                y: false, // override required
                z: Layer3{} // full default
            }
        };
    }
}
