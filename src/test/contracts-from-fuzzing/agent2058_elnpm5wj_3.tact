struct DeepNested {
    n1: Int;
    opt: Inner?;
}

struct Inner {
    flag: Bool;
    comment: String;
}

contract Test {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            n1: 2,
            opt: Inner{flag: true, comment: "yes"}
        };
    }
}