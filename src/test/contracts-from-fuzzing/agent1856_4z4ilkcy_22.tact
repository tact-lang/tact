struct InnerFix {
    x: Int;
    y: Int;
    z: Bool;
}

contract DefaultsInits {
    f: InnerFix;

    init() {
        self.f = InnerFix{
            x: 0,
            y: 0,
            z: false
        };
    }
}
