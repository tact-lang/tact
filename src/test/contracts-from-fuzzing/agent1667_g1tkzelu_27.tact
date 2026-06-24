struct Leaf { val: Int = 42; }
struct Middle { leaf: Leaf; }
struct Top { mid: Middle; }

contract PartialMid {
    t: Top;

    init() {
        self.t = Top{ mid: Middle{ leaf: Leaf{} } };
    }
}
