struct DeepOptional {
    inner: Int?;
}

contract StorageDefaultOpt {
    opt1: Int?;
    opt2: DeepOptional?;
    opt3: DeepOptional;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = DeepOptional{ inner: null };
    }
}