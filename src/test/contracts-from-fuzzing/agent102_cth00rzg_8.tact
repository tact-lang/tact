struct DeeplyNested {
    x: Int;
    level2: Second;
}

struct Second {
    y: Int;
    level3: Third;
}

struct Third {
    z: Int;
    msg: String;
}

contract NestedDeep {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            x: 1,
            level2: Second{
                y: 2,
                level3: Third{
                    z: 3,
                    msg: "hi"
                }
            }
        };
    }
}