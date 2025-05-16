struct MultiOptionals {
    inner1: InnerOpt1?;
    inner2: InnerOpt2?;
}
struct InnerOpt1 {
    val: Int;
}
struct InnerOpt2 {
    flag: Bool;
}
contract ManyNestedOpts {
    store: MultiOptionals;
    init() {
        self.store = MultiOptionals{
            inner1: null,
            inner2: null
        };
    }
}