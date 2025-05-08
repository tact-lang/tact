struct DeepInner {
    x: Int;
    y: Bool;
}

struct Wrapper {
    w: DeepInner;
    z: String;
}

contract DeepNestedContract {
    nested: Wrapper;

    init() {
        self.nested = Wrapper{
            w: DeepInner{ x: 7, y: true },
            z: "deep"
        };
    }
}