struct Booly {
    x: Bool;
    y: Bool;
    z: Bool;
}

contract BoolsInStruct {
    b: Booly;

    init() {
        self.b = Booly{
            x: true,
            y: false,
            z: true,
        };
    }
}
