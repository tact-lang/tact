struct DeepNested {
    inner: Params;
    flag2: Bool;
}

struct Params {
    s: String;
    n: Int?;
    flag: Bool;
}

contract TestDeepNest {
    store: DeepNested;
    init() {
        self.store = DeepNested{
            inner: Params{
                s: "hi",
                n: 5,
                flag: false
            },
            flag2: true
        };
    }
}
