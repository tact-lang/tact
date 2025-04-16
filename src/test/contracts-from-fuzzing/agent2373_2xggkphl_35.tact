struct BoolWithDefaultAndOptional {
    b: Bool = false;
    opt: Bool?;
}

contract BoolMixFields {
    data: BoolWithDefaultAndOptional;
    init() {
        self.data = BoolWithDefaultAndOptional{ opt: null };
    }
}