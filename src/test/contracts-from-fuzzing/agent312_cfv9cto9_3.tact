struct Nested { v: Int }

struct Wrap { n: Nested? }

contract TestContract {
    wrap: Wrap;
    init() {
        self.wrap = Wrap{ n: null };
    }
}