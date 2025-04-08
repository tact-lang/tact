struct DeeplyOptional {
    nested: Int?;
    flag: Bool;
}

contract DeepOption {
    data: DeeplyOptional?;

    init() {
        self.data = DeeplyOptional{ nested: null, flag: true };
    }
}