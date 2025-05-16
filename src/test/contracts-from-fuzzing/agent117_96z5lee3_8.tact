struct InnerOpt {
    x: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalStructField {
    nested: InnerOpt;

    init() {
        self.nested = InnerOpt{x:null, b:null, s:null};
    }
}