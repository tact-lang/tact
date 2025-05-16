struct MixPrimitive {
    valInt: Int;
    valBool: Bool;
    valAddr: Address;
    valStr: String;
}

contract MixedPrimitives {
    mix: MixPrimitive;

    init() {
        self.mix = MixPrimitive{
            valInt: 1,
            valBool: false,
            valAddr: myAddress(),
            valStr: "abc"
        };
    }
}