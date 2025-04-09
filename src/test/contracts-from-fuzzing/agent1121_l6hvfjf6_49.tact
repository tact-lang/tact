// Deep optional tree with booleans and ints
struct Leaf {
    b: Bool?;
    n: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract OptionalBoolIntTree {
    data: Branch;

    init() {
        self.data = Branch{left:null, right:null};
    }
}