// optional primitive fields interleaved with required
contract MixInterleave {
    x: Int;
    y: Int?;
    z: Int;

    init() {
        self.x = 1;
        self.y = null;
        self.z = 3;
    }
}
