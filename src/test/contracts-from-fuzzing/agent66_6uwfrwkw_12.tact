struct SOptInt {
    foo: Int?;
}

contract MultiOptStruct {
    a: SOptInt;
    b: SOptInt;

    init() {
        self.a = SOptInt{ foo: null };
        self.b = SOptInt{ foo: 7 };
    }
}