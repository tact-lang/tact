struct S { x: Int = 1; y: Bool = true; z: String = "hello"; }

contract Test {
    s: S;

    init() {
        self.s = S{};
    }
}