struct InnerMost {
    x: Int;
}

struct InnerOpt {
    data: InnerMost?;
}

struct OutStruct {
    inner: InnerOpt;
}

contract NestedOptionals {
    st: OutStruct;

    init() {
        self.st = OutStruct{
            inner: InnerOpt{ data: null }
        };
    }
}