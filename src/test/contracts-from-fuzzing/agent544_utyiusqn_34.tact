struct Inner { foo: Int?; }
struct Outer { bar: Inner = Inner{}; }

contract TestContract {
    x: Outer;
    init() {
        self.x = Outer{};
    }
}