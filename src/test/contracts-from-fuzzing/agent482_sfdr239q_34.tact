struct DeepCompo {
    x: Int as uint8;
    y: String?;
}

struct WrapComp {
    nested: DeepCompo?;
    flag: Bool;
    note: String;
}

contract ParamDeepMix(
    stuff: WrapComp,
) {
    receive() {
        let _ = self.stuff.note;
    }
}
