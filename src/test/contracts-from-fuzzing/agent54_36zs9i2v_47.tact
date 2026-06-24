struct WrapBoolInt {
    a: Bool;
    b: Int;
}

contract StructOrderMix {
    s: WrapBoolInt;
    init() {
        self.s = WrapBoolInt{a:false,b:42};
    }
}