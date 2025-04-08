// Optional top-level storage variable with complex nested struct
struct InnerMost {
    x: Int?;
    y: Bool;
    z: String?;
}

struct Middle {
    a: Int;
    b: InnerMost;
}

struct Outer {
    m: Middle;
}

contract TestContract {
    complexOpt: Outer?;

    init() {
        self.complexOpt = null;
    }
}