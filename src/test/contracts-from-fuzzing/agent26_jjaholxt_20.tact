struct Leaf { val: Int? }
struct Middle { leaf: Leaf? }
struct Root { mid: Middle }

contract DeepParam(
    r: Root
) {
    receive() {}
}