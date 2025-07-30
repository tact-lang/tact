struct Leaf {
    n: Int;
    flag: Bool;
}

struct Combo {
    leaf: Leaf;
    maybeLeaf: Leaf?;
    label: String;
    done: Bool;
}

contract DeepComboTest {
    data: Combo;

    init() {
        self.data = Combo{
            leaf: Leaf{ n: 1, flag: true },
            maybeLeaf: null,
            label: "hi",
            done: false
        };
    }
}