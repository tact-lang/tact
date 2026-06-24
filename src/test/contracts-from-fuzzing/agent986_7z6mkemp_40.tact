struct I1 { x: Int?; y: Bool?; z: String?; }
struct I2 { m: I1?; }
struct I3 { n: I2?; }
struct I4 { o: I3?; }
struct I5 { p: I4?; }

contract NullableDeep {
    s: I5;

    init() {
        self.s = I5{ p: null };
    }
}
