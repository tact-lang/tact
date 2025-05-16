struct Inner {
    val: Int;
    opt: Bool?;
}
struct Wrapper {
    inner: Inner;
    label: String;
}
contract NestedOptional {
    persistent: Wrapper = Wrapper{
        inner: Inner{ val: 123, opt: null },
        label: "init"
    };

    init() {
        self.persistent = Wrapper{
            inner: Inner{ val: 321, opt: true },
            label: "modified"
        };
    }
}