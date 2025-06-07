struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    label: String;
}

contract OptNested {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            inner: null,
            label: "hi"
        };
    }
}