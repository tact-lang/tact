struct OptInner {
    a: Int;
    b: Int?;
}
contract OptInnerContract {
    data: OptInner;
    init() {
        self.data = OptInner{ a:22, b:null };
    }
}