struct Leaf { val: Int; }
struct Middle { leaf: Leaf; }

contract TestContract {
    optMid: Middle? = null;
    init() {}
}