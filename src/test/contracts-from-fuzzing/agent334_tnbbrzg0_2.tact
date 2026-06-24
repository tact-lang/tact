struct Nested { a: Int; b: Bool; }
struct Outer { n: Nested; flag: Bool; }
contract Test {
    storage: Outer;

    init() {
        self.storage = Outer{ n: Nested{ a: 10, b: false }, flag: true };
    }
}