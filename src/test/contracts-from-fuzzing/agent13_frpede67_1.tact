struct Nested { a: Int; }

struct Outer { nested: Nested; b: Bool; }

contract TestContract {
    val: Outer;
    init() {
        self.val = Outer{ nested: Nested{ a: 5 }, b: false };
    }
}