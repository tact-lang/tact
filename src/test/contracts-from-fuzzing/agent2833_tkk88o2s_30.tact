struct BoolString {
    a: Bool;
    b: String;
}

contract SerialMix {
    x: Int as uint32;
    y: Int as int64;
    z: BoolString;

    init() {
        self.x = 101;
        self.y = -42;
        self.z = BoolString{ a:true, b:"test" };
    }
}