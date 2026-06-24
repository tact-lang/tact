struct MixedSerial {
    amount: Int as uint32;
    owner: Address;
    enabled: Bool;
}

contract HasFixedStruct {
    data: MixedSerial;

    init() {
        self.data = MixedSerial{
            amount: 123456,
            owner: myAddress(),
            enabled: true
        };
    }
}