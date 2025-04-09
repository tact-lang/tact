struct S { val: Int; }
contract OptionalStruct {
    data: S?;

    init() {
        self.data = S{val: 7};
    }
}