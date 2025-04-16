struct NestedBoolOpt {
    x: Bool?;
    y: Bool?;
    z: Bool?;
}

contract OptBits {
    flags: NestedBoolOpt;
    init() {
        self.flags = NestedBoolOpt{ x: true, y: null, z: false };
    }
}