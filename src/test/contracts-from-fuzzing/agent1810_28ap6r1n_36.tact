struct DeepWrap {
    val: Int;
}

struct OuterWrap {
    inner: DeepWrap;
}

struct OuterOptionalWrap {
    inner: OuterWrap?;
}

contract OptionalsNested {
    state: OuterOptionalWrap?;

    init() {
        self.state = null;
    }
}