struct Leaf { foo: Int; }
struct Branch { leaf: Leaf?; }

contract ParamMix(
    branch: Branch?,
    flag: Bool,
) {}