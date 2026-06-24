struct DeepOptional {
    inner: InnerOpt?;
}
struct InnerOpt {
    val: Int?;
}
contract OptContract {
    store: DeepOptional;
    init() {
        self.store = DeepOptional{
            inner: InnerOpt{val:null}
        };
    }
}