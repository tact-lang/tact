struct Leaf { val: Int?; }
struct Branch { leaf: Leaf?; }
struct Root { branch: Branch?; }

contract PartialDeep {
    r: Root;

    init() {
        self.r = Root{
            branch: Branch{
                leaf: null
            }
        };
    }
}