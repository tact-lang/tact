struct InnerOpt {
    x: Int?;
    y: String?;
}

struct MidOpt {
    inner: InnerOpt?;
    flag: Bool?;
}

struct OuterOpt {
    middle: MidOpt?;
    label: String?;
}

contract TestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            middle: MidOpt{
                inner: null,
                flag: true
            },
            label: null
        };
    }
}
