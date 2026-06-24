struct OptNestedInner {
    x: Int?;
    y: Bool?;
}

struct OptDeepNested {
    inner: OptNestedInner?;
    flag: Bool;
}

contract OptionalDeepTest {
    data: OptDeepNested;

    init() {
        self.data = OptDeepNested{
            inner: null,
            flag: true,
        };
    }
}