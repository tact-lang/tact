struct InnerInfo {
    a: Int;
    t: String;
}

struct OptionalStructHolder {
    inner: InnerInfo?;
    count: Int;
}

contract OptionalNestedStruct {
    data: OptionalStructHolder;

    init() {
        self.data = OptionalStructHolder{
            inner: null,
            count: 5,
        };
    }
}