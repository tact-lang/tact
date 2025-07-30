struct InnerOptional {
    x: Int?;
    y: Bool?;
}

struct OuterOptional {
    s: String?;
    inner: InnerOptional;
}

contract Test3 {
    complexOpt: OuterOptional;
    init() {
        self.complexOpt = OuterOptional{
            s: "hello",
            inner: InnerOptional{
                x: null,
                y: true
            }
        };
    }
}