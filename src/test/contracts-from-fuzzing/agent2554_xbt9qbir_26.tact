struct Leaf { val: Int?; }
struct Branch { leaf: Leaf?; }
struct Root { branch: Branch?; }

contract DeepAssign {
    r: Root;

    init() {
        self.r = Root{
            branch: Branch{
                leaf: Leaf{
                    val: 123
                }
            }
        };
    }
}