// Multiple levels of optionals containing strings and bools
struct Leaf { name: String?; flag: Bool?; }
struct Node { leaf: Leaf?; }
struct Branch { node: Node?; }

contract OptStringBoolNest {
    branch: Branch?;

    init() {
        self.branch = Branch{
            node: Node{
                leaf: Leaf{
                    name: null,
                    flag: null
                }
            }
        };
    }
}