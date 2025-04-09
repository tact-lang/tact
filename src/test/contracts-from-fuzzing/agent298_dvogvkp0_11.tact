struct DefaultMix {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
}

contract Defaults {
    x: DefaultMix;
    init() {
        self.x = DefaultMix{};
    }
}