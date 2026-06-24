// Optional of a struct with primitive + optional primitive
struct SemiOpt {
    x: Int;
    y: Bool?;
}

contract SemiOptStore {
    s: SemiOpt?;
    init() {
        self.s = SemiOpt{ x: 2, y: null };
    }
}
