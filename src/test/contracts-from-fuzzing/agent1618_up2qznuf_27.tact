struct MixOptFixed {
    s: String? = null;
    i: Int as uint64;
    b: Bool;
}

contract OptAndFixed {
    data: MixOptFixed;

    init() {
        self.data = MixOptFixed{s: null, i: 777, b: true};
    }
}