struct MidLevel {
    b: Int;
}

struct TopLevel {
    inner: MidLevel;
}

contract DeepAccess {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            inner: MidLevel{
                b: 42
            }
        };
    }
}
