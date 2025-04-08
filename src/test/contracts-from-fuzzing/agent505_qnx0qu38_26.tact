struct Inner01 {
    foo: Int?;
    bar: Bool?;
}

contract OptInStruct {
    data: Inner01 = Inner01{ foo: null, bar: null };

    init() {
        self.data = Inner01{ foo: 11, bar: true };
    }

    receive() {
        self.data = self.data;
    }
}