struct EmptyOptStr {
    a: String?;
}

contract EmptyOptStrTest {
    data: EmptyOptStr;

    init() {
        self.data = EmptyOptStr{ a:null };
    }
}