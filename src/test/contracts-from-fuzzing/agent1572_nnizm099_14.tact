// Testing optional struct nested inside optional field
struct InnerOpt {
    val: Int?;
    text: String;
}

struct OuterOpt {
    inner: InnerOpt?;
    num: Int;
}

contract OptionalStructInOptional {
    data: OuterOpt = OuterOpt{inner: null, num: 5};

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{val: null, text: "hi"},
            num: 42
        };
    }
}