struct DeepOpt {
    nested: Int?;
}

contract OptStructField {
    optField: DeepOpt; 
    init() {
        self.optField = DeepOpt{ nested: null };
    }
}