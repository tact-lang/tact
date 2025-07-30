struct DeepNested {
    inner: InnerNested;
    flag: Bool;
}

struct InnerNested {
    x: Int;
    optString: String?;
}

contract DeepContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            flag: false,
            inner: InnerNested{
                x: -7,
                optString: null
            }
        };
    }
}