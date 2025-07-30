struct WrapAddr {
    a: Address;
}
struct WrapInt {
    i: Int;
}
struct WrapBool {
    b: Bool;
}
struct WrapString {
    s: String;
}

struct DeepMix {
    addr: WrapAddr;
    number: WrapInt;
    flag: WrapBool;
    text: WrapString;
}

contract StructWrapMulti {
    x: DeepMix;

    init() {
        self.x = DeepMix{
            addr: WrapAddr{a:myAddress()},
            number: WrapInt{i:42},
            flag: WrapBool{b:true},
            text: WrapString{s:"hi"}
        };
    }
}