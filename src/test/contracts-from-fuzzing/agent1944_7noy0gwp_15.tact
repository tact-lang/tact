struct InnerOpt {
    value: Int?;
}

struct Container {
    i: Int;
    inner: InnerOpt;
}

contract OptionalInnerContract {
    data: Container;

    init() {
        self.data = Container{ i:10, inner: InnerOpt{ value:null } };
    }
}