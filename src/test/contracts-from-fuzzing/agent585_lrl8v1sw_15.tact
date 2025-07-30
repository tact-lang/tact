struct Leaf { v: Int }
struct Branch { leaf: Leaf? }
struct Root { branch: Branch }

contract NestedParam(
  tree: Root
) {
  receive() {}
}