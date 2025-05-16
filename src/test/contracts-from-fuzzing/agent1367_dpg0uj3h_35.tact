struct Alternating {
    x: Int?;
    y: Bool;
    z: String?;
    w: Address;
}

contract AltStructs {
    a: Alternating;
    b: Alternating;

    init() {
        self.a = Alternating{ x: null, y: true, z: null, w: myAddress() };
        self.b = Alternating{ x: null, y: false, z: null, w: myAddress() };
    }
}