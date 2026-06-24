struct P { x: Int; }
struct Q { y: Int; }

contract OptionBranches {
    a: P?;
    b: Q?;
    init() {
        self.a = null;
        self.b = null;
    }
}