struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract MultiLevelOption {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: InnerMost{
                    val: 123
                }
            }
        };
    }
}