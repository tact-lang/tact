struct MultiOption {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Int?;
    f5: Bool?;
}

contract MultiOptionalFields {
    opts: MultiOption;

    init() {
        self.opts = MultiOption{
            f1: null, f2: null, f3: null, f4: null, f5: null
        };
    }
}