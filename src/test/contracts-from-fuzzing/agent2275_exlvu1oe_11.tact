struct OptA { a: Int?; }
struct OptB { b: OptA?; }
struct OptC { c: OptB?; }

contract OptionalDepth {
    deep: OptC;
    init() {
        self.deep = OptC{ c: null };
    }
}