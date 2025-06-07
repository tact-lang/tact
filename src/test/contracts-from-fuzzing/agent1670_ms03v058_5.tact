struct NestedOptional {
    opt: DeepNested?;
}

struct DeepNested {
    inner: Params;
    flag2: Bool;
}

struct Params {
    s: String;
    n: Int?;
    flag: Bool;
}

contract TestNestedOptional {
    store: NestedOptional;
    init() {
        self.store = NestedOptional{
            opt: null
        };
    }
}
