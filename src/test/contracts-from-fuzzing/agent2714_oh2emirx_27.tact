struct SerOptMix {
    i8: Int as int8;
    optu32: Int? as uint32;
    b: Bool;
    s: String;
}

contract Test27 {
    sm: SerOptMix;

    init() {
        self.sm = SerOptMix{ i8: -128, optu32: null, b: true, s: "ok" };
    }
}