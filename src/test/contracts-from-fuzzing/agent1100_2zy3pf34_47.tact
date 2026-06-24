struct Inner {
    a: Int;
    b: Bool?;
}

contract InnerOptCombi {
    data: Inner;

    init() {
        self.data = Inner{ a: 1, b: null };
    }
}
