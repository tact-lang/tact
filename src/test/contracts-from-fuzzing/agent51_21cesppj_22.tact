struct Inside {
    x: Int;
    y: Bool;
    z: String;
}

contract MultiTypeStructs {
    a: Inside;
    b: Inside;

    init() {
        self.a = Inside{ x: 1, y: true, z: "hey" };
        self.b = Inside{ x: 2, y: false, z: "ho" };
    }
}