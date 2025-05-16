struct Leaf {
    val: Int;
    note: String?;
}

struct Branch {
    left: Leaf;
    right: Leaf?;
}

contract ParamStorage(
    root: Branch,
    count: Int,
    owner: Address,
) {
    receive() {
        // use root, count, owner here to ensure compilation
        let _ = self.root;
        let _ = self.count;
        let _ = self.owner;
    }
}