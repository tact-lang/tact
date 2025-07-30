struct Leaf { flag: Bool?; }
struct Branch { leaf: Leaf?; val: Int; }
struct Tree { branch: Branch?; rootVal: Int; }

contract DeepParam(
    t: Tree,
) {}