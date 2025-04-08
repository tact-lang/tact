struct OptS1 { x: Int?; }
struct OptS2 { y: String?; }
struct OptS3 { z: Address?; }

contract NullWide {
    s1: OptS1?;
    s2: OptS2?;
    s3: OptS3?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }
}