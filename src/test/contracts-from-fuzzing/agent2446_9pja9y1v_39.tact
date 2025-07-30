struct OptDefaultMix {
    x: Int? = null;
    y: Bool = false;
}

contract OptionalDefaultMix {
    val: OptDefaultMix;

    init() {
        self.val = OptDefaultMix{};
    }
}