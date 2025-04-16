// test persistent Int with serialization override that is larger than runtime value
contract TestBigSerialize {
    value: Int as uint128;

    init() {
        self.value = 42;
    }
}
