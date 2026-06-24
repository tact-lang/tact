struct IntBoolString {
    iv: Int;
    bv: Bool;
    sv: String;
}

contract ManyTypes {
    s: IntBoolString;

    init() {
        self.s = IntBoolString{
            iv: 123,
            bv: true,
            sv: "hello",
        };
    }
}