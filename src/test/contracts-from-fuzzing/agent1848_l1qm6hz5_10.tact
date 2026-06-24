struct SerializeStruct {
    small: Int as uint8;
    big: Int as uint256;
    mid: Int as int128;
    s: String;
}

contract SerializeStructContract {
    data: SerializeStruct;

    init() {
        self.data = SerializeStruct{
            small: 5,
            big: 123456789,
            mid: -1234567,
            s: "hi"
        };
    }
}