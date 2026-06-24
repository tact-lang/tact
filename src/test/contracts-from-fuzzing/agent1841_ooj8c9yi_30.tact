struct InnerOptStr {
    s: String?;
}

contract InnerOptStrTest {
    data: InnerOptStr;

    init() {
        self.data = InnerOptStr{
            s: null
        };
    }
}
