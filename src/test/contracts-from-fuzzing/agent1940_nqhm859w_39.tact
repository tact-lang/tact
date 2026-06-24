struct Combo {
    x: Int;
    y: Bool?;
    z: String;
}

contract NullableFieldMix {
    d: Combo;
    init() {
        self.d = Combo{ x:1, y:null, z: "h" };
    }
}