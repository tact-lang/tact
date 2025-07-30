struct OptionalNested {
    val1: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
    txt: String?;
}

contract OptNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            val1: null,
            inner: InnerOpt{ flag: null, txt: "hello" }
        };
    }
}