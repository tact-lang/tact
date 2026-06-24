struct Leaf { val: Int? }
struct Node { leaf: Leaf? }
struct Wrapper { node: Node }

contract TestContract(
    data: Wrapper
) {}