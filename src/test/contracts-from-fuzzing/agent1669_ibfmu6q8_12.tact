struct Inner {
    v: Int?;
}
struct Wrapper {
    inner: Inner;
}
contract InnerOptionalDefault {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: Inner{ v: null },
        };
    }
}