struct MixDefOpt {
    x: Int = 7;
    y: String? = null;
    z: Bool?;
}

contract Test {
    f: MixDefOpt;
    init() {
        self.f = MixDefOpt{ z: true };
    }
}