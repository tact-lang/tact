struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    label: String?;
}

contract OptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            label: null
        };
    }
}