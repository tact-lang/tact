struct SDeep {
    x: Int;
    y: Bool;
}

struct SMid {
    nest: SDeep;
}

struct SOut {
    mid: SMid?;
}

contract OptionalMiddle {
    s: SOut;
    init() {
        self.s = SOut{mid: null};
    }
}