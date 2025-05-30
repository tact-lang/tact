// multiple fields, mix explicit defaults, implicit nulls, nested optionals
struct S2 { f1: String?; f2: Int?; }

contract Test {
    x: Int = 1;
    y: String;
    z: Bool = false;
    nestedOpt: S2?;

    init() {
        self.y = "abc";
        self.nestedOpt = null;
    }
}