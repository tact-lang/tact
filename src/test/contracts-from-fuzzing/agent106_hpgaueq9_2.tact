struct Inner { x: Int; y: Bool; }
struct Outer { p: Inner; q: Int?; }

contract DeepOptional {
    s: Outer = Outer{ p: Inner{ x: 1, y: false }, q: null };

    init() {
        self.s = Outer{ p: Inner{ x: 7, y: true }, q: 100 };
    }

    receive() {}
}