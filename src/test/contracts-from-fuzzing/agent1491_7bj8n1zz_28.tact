struct Leaf { val: Int = 33 }
struct Mid { leaf: Leaf? = null }
struct Outer { mid: Mid? = null }

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{};
    }
}