// Top-level contract storage variable is optional struct
struct A {
    x: Int;
    y: Bool;
}

contract TestContract {
    optA: A?;
    init() {
        self.optA = null;
    }
}