struct OptDeepInner {
    x: Int?;
    y: Bool?;
}

struct OptDeepOuter {
    inner: OptDeepInner?;
    label: String;
}

contract OptNestedStorage {
    data: OptDeepOuter;

    init() {
        self.data = OptDeepOuter{
            inner: null,
            label: "hello"
        };
    }
}