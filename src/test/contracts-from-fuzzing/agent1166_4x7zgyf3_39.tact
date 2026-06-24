// Large composite struct fully optional
struct F {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract FullyOptionalStruct {
    f: F?;
    init() {
        self.f = null;
    }
}
