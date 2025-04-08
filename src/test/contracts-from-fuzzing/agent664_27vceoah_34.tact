struct O1 {
    f: Int?;
}

struct O2 {
    g: O1?;
}

contract NestedOptChain {
    val: O2;

    init() {
        self.val = O2{ g: null };
    }
}
