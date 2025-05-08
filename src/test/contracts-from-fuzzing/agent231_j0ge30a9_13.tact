struct Leaf {
    payload: Bool?;
    number: Int;
}

struct Branch {
    leaf: Leaf;
    flag: Bool;
}

contract DeeplyNestedPersist {
    value: Branch;

    init() {
        self.value = Branch{
            leaf: Leaf{ payload: null, number: 7 },
            flag: true
        };
    }
}