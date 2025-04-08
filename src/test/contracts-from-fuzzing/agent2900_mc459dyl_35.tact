struct S1 { f: Int; }
struct OptS1 { s: S1?; }
struct OptOptS1 { x: OptS1?; }

contract LayeredOpt {
    data: OptOptS1?;

    init() {
        self.data = null;
    }
}
