struct InnerOpt {
    text: String?;
    num: Int;
}

struct OuterStruct {
    inner: InnerOpt?;
    val: Bool;
}

contract NestedOpts {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerOpt{text: null, num: 99},
            val: false
        };
    }
}
