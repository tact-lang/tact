// Optional containing struct with optional primitive
struct S1 { v: Int?; }

contract Test {
    s: S1?;

    init() {
        self.s = S1{ v: null };
    }
}