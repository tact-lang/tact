struct DeepOpt2 {
    inn: OptWrap?;
    val: Int;
}

struct OptWrap {
    inner: InnerMost;
}

struct InnerMost {
    f: Bool;
    s: String;
}

contract OptionalNested {
    data: DeepOpt2;

    init() {
        self.data = DeepOpt2{inn: null, val: 5};
    }
}