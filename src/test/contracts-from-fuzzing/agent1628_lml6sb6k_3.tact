struct OptNested {
    optInner: DeepNested?;
}

struct DeepNested {
    x: Int;
    y: Bool;
    z: String;
}

contract OptionalNestedStructContract {
    data: OptNested;

    init() {
        self.data = OptNested{ optInner: null };
    }
}