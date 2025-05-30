struct NestedOpt {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract MixedOptional {
    fixed: Int;
    opt: NestedOpt;

    init() {
        self.fixed = 123;
        self.opt = NestedOpt{ x: null, y: null, z: null };
    }
}