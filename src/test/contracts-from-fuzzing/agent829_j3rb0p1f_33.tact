struct DeeplyNested {
    s: Inner;
}

struct Inner {
    f: Bool;
}

contract NestedBool {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            s: Inner{
                f: true,
            }
        };
    }
}