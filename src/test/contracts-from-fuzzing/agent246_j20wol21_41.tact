struct OptionWrap {
    inner: OptionInner?;
}
struct OptionInner {
    flag: Bool;
}
contract NestedOptWrap {
    f: OptionWrap;

    init() {
        self.f = OptionWrap{
            inner: OptionInner{flag:true}
        };
    }
}