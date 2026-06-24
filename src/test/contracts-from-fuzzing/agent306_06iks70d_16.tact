struct InnerOpt {
    val: Int?;
}
struct ContainsOpt {
    inner: InnerOpt?;
}
contract OptionalInnerStruct {
    data: ContainsOpt;

    init() {
        self.data = ContainsOpt{
            inner: InnerOpt{val:null}
        };
    }
}
