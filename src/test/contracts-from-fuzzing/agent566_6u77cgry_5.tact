struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inner: InnerOpt?;
}

contract OptionalNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}