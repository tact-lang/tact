// complex shape optionals nested struct
struct N1 { a: Int?; b: Bool?; next: N2?; }
struct N2 { x: Int?; y: Bool?; s: String?; }

contract ComplexOptionStruct {
    n: N1?;

    init() {
        self.n = null;
    }
}