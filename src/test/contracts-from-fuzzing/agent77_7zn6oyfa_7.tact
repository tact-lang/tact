// Disjoint optional nested struct fields
struct OptA { a: Int; }
struct OptB { b: OptA?; }

contract OptNest {
    b: OptB;
    init() {
        self.b = OptB{ b: null };
    }
}