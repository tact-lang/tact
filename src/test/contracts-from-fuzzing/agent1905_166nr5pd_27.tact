struct InnerContainer {
    a: Int?;
    b: Bool;
}

struct MiddleContainer {
    inner: InnerContainer?;
}

struct OuterContainer {
    middle: MiddleContainer?;
}

contract MultiLevelNullables {
    val: OuterContainer;

    init() {
        self.val = OuterContainer{
            middle: null,
        };
    }
}