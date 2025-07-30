// Deep nesting, with the last leaf being a string
struct Leaf {
    s: String;
}

struct Branch1 {
    leaf: Leaf;
}

struct Branch2 {
    branch: Branch1;
}

contract DeepNestedString {
    val: Branch2;

    init() {
        self.val = Branch2{
            branch: Branch1{
                leaf: Leaf{
                    s: "hi"
                }
            }
        };
    }
}