struct SerialStruct {
    num: Int as uint8;
    flag: Bool;
    text: String;
}

contract SerialContract {
    s: SerialStruct;

    init() {
        self.s = SerialStruct{
            num: 255,
            flag: true,
            text: "hello",
        };
    }
}