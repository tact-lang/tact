struct StructA { a: Int; }
struct StructB { b: Bool; }

contract TwoStructs {
    sa: StructA;
    sb: StructB;

    init() {
        self.sa = StructA{ a: 55 };
        self.sb = StructB{ b: false };
    }
}