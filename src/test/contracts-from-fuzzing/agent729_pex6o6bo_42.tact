struct NullableAddrWrap {
    val: Address?;
}

contract NullableAddrStruct {
    foo: NullableAddrWrap;
    init() {
        self.foo = NullableAddrWrap{val: null};
    }
    receive() {}
}