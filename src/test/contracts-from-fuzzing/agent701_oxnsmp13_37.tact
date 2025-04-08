struct Wrap {
    inner: Int;
}

contract DefaultStructField {
    data: Wrap = Wrap{ inner: 7 };

    init() {
        self.data = Wrap{ inner: 8 };
    }
}