// Test the case when serialization annotation limits are exceeded during init
contract IntSerializeFail {
    u4: Int as uint4;

    init() {
        self.u4 = 20; // exceeds 4-bit unsigned max (15)
    }
}
