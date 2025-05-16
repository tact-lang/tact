struct Leaf { val: Int? = null; }
struct Branch { leaf: Leaf; }
struct Root { branch: Branch; }

contract ParamContract(
    root: Root,
) {}