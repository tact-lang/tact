struct Combo {
    normalInt: Int;
    uint8Int: Int as uint8;
    int32Int: Int as int32;
    boolVal: Bool;
    strVal: String;
}

contract SerialTest {
    data: Combo;

    init() {
        self.data = Combo{
            normalInt: 127,
            uint8Int: 255,
            int32Int: -1000,
            boolVal: true,
            strVal: "s"
        };
    }
}
