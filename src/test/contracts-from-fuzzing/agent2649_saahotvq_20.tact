struct DeeplyOptional {
    a: Int?;
    b: Bool?;
}

struct MidLayer {
    inner: DeeplyOptional?;
    flag: Bool;
}

struct TopLayer {
    mid: MidLayer?;
    s: String;
}

contract NestedOptionals {
    val: TopLayer;

    init() {
        self.val = TopLayer{
            mid: null,
            s: "hi",
        };
    }
}