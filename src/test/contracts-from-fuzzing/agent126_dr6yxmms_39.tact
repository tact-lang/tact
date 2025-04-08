struct DefaultsWithSerial {
    small: Int as uint4 = 3;
    flag: Bool = true;
    words: String = "hi";
}

contract DefaultsSerialMix {
    defSer: DefaultsWithSerial;

    init() {
        self.defSer = DefaultsWithSerial{};
    }
}