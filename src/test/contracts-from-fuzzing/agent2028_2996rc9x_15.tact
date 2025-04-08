struct InnerOpt {
    value: Int?;
}

struct Container {
    inner: InnerOpt;
}

contract OptionalInNested {
    rec: Container;

    init() {
        self.rec = Container{
            inner: InnerOpt{ value: null }
        };
    }
}
