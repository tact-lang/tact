struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost?;
}

struct OuterMost {
    middle: Middle?;
}

contract MultiLevelNullable {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            middle: null
        };
    }
}