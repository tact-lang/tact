message((crc32("Msg")+42)&0xFFFFFFFF) SpecialMsg {
    foo: Int;
    bar: Bool?;
}

contract Test {
    pm: SpecialMsg;

    init() {
        self.pm = SpecialMsg{
            foo: 5,
            bar: null,
        };
    }
}