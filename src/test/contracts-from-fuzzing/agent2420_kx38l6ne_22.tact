struct InnerOpt {
    flag: Bool?;
}
struct OuterOpt {
    inner: InnerOpt?;
    val: Int;
}

contract OptionWrap {
    store: OuterOpt;

    init() {
        self.store = OuterOpt{
            inner: null,
            val: 5,
        };
    }
}