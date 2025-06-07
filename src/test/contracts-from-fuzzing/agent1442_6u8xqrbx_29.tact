// nested optional with default null overriding deeper default
struct Leaf { n: Int = 7; }
struct Box { val: Leaf? = null; }

contract TestContract {
    box: Box;
    init() {
        self.box = Box{};
    }
}