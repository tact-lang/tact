struct S1 { x: Int }
struct S2 { y: S1? }
struct S3 { z: S2? }

contract OptionOpt {
    top: S3?;
    init() {
        self.top = null;
    }
}