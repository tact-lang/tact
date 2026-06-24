// test nested struct with optional nested struct, multiple levels
struct InnerMost { iv: Int; }
struct Middle { mid: InnerMost?; }
struct OuterMost { outer: Middle?; flag: Bool; }

contract TestContract {
    composite: OuterMost;
    init() {
        self.composite = OuterMost { outer: null, flag: true };
    }
}