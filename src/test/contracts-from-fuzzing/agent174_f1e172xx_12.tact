struct WrapBool {
    b: Bool;
}

struct WrapInt {
    i: Int;
}

struct Compose {
    boolWrap: WrapBool;
    intWrap: WrapInt;
}

contract TestContract {
    composed: Compose;

    init() {
        self.composed = Compose{ boolWrap: WrapBool{b:true}, intWrap: WrapInt{i:42} };
    }
}