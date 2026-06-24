struct Inner { x: Int = 1; }
struct Outer { maybe: Inner?; }

contract OptNestTest {
    data: Outer = Outer{};
}