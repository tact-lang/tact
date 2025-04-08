struct InnerOpt {
    a: Int;
    b: Bool;
}

struct OuterWrap {
    val: InnerOpt?;
    s: String;
}

contract NestedOptStruct {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{
            val: null,
            s: "hi"
        };
    }
}