struct EvenDeeper {
    label: String;
    child: ChildNode?;
}

struct ChildNode {
    score: Int;
    flag: Bool;
}

contract OptionalNestedContract {
    root: EvenDeeper;

    init() {
        self.root = EvenDeeper{
            label: "Root",
            child: null,
        };
    }
}