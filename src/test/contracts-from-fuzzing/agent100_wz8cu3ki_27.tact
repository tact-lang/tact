struct S {
    foo: Int;
}
contract Test28 {
    data1: S;
    data2: S;
    data3: S;
    data4: S;

    init() {
        self.data1 = S{ foo: 1 };
        self.data2 = S{ foo: 2 };
        self.data3 = S{ foo: 3 };
        self.data4 = S{ foo: 4 };
    }
}