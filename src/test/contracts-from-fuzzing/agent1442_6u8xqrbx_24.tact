// nested default values in structs
struct Leaf { val: Int = 10; }
struct Parent { child: Leaf = Leaf{}; }

contract TestContract {
    p: Parent;
    init() {
        self.p = Parent{};
    }
}