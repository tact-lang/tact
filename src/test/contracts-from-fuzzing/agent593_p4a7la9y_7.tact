struct InnerOpt {
    number: Int?;
    flag: Bool;
}

struct OuterHolder {
    inner: InnerOpt?;
    name: String;
}

contract NestedOptionals {
    data: OuterHolder;

    init() {
        self.data = OuterHolder{
            inner: null,
            name: "test"
        };
    }
}