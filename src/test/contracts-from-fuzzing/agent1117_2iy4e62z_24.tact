struct Padded {
    x: Int as uint4;
    y: Int;
    z: Int as uint8;
}

contract HasPadded {
    data: Padded;

    init() {
        self.data = Padded{ x:5,y:10,z:20 };
    }
}
