struct BigSerialized {
    i1: Int as uint256;
    i2: Int as int256;
    i3: Int as int257;
}

contract BigSerializedContract {
    data: BigSerialized;

    init() {
        self.data = BigSerialized{
            i1: 1,
            i2: -1,
            i3: 2
        };
    }
}
