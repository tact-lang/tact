// test persistent Int with minimal serialization override
contract TestSmallSerialize {
    value: Int as uint2;

    init() {
        self.value = 2;
    }
}
