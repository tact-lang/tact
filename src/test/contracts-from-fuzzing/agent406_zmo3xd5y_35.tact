struct MixDefOpt {
    a: Int = 7;
    b: Bool? = true;
    s: String? = null;
}

contract MixDefaultOpt {
    val: MixDefOpt;
    init() {
        self.val = MixDefOpt{};
    }
}