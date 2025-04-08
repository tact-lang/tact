struct MidOptional { mid: Inner?; }
struct Inner { val: Int; }

contract MidOpt {
    f: MidOptional;

    init() {
        self.f = MidOptional{ mid: null };
    }
}
