struct SerializeStruct {
    ux: Int as uint8;
    sy: Int as int64;
    big: Int as uint256;
}

contract TestContract {
    data: SerializeStruct;
    init() {
        self.data = SerializeStruct{
            ux: 250,
            sy: -123,
            big: 999999,
        };
    }
}