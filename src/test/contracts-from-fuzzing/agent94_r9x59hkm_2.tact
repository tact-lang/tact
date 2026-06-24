struct DeepInner {
    val1: Int;
    val2: Bool;
    optStr: String?;
}

struct OuterContainer {
    inner: DeepInner;
    flag: Bool;
    maybeInt: Int?;
}

contract NestedStructStorage {
    data: OuterContainer;

    init() {
        self.data = OuterContainer{
            inner: DeepInner{
                val1: 123,
                val2: true,
                optStr: null,
            },
            flag: false,
            maybeInt: null
        };
    }
}