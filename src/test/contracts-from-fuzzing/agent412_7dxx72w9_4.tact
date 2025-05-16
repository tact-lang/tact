struct Level3 {
    leaf: Int?;
}

struct Level2 {
    optionalInner: Level3?;
    someVal: Bool;
}

struct Level1 {
    nested: Level2;
    comment: String?;
}

contract DeepNested {
    tree: Level1 = Level1{
        nested: Level2{
            optionalInner: null,
            someVal: true
        },
        comment: null
    };

    receive() {
        let _ = self.tree.nested.someVal;
    }
}