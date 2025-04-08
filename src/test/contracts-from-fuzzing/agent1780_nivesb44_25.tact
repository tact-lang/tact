struct InnerMost {
    msg: String?;
}

struct Container {
    inner: InnerMost?;
}

contract OptionalInOptional {
    data: Container;

    init() {
        self.data = Container{ inner: null };
    }
}