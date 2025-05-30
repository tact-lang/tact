struct InnerOpt {
    v: Int;
    flag: Bool;
}

struct OuterOpt {
    inner: InnerOpt?;
    label: String;
}

contract OptStruct {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            label: "test"
        };
    }
}