struct InnerOpt {
    flag: Bool;
    info: String?;
}

struct Middle {
    sub: InnerOpt?;
    count: Int;
}

struct OuterOpt {
    mid: Middle?;
    mark: Bool;
}

contract DeepOptionalsTest {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            mid: Middle{
                sub: null,
                count: 123
            },
            mark: true
        };
    }
}