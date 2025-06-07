struct Packed {
    x: Int as int64;
    y: Int as uint8;
    z: Bool;
    s: String;
}

contract PackedStruct {
    p: Packed;

    init() {
        self.p = Packed{ x: 1, y: 2, z: true, s: "hi" };
    }
}