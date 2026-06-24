struct Inner {
    x: Int;
    opt: Innermost?;
}

struct Innermost {
    y: Bool;
    z: Cell?;
}

struct DeepNested {
    nested: Inner;
}

contract TestDeep {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            nested: Inner{
                x: 1,
                opt: Innermost{ y: true, z: null }
            }
        };
    }
}
