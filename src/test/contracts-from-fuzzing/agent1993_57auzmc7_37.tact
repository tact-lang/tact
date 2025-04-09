struct FieldOpts {
    f1: Int?; f2: String?; f3: Bool?; 
}

contract ManyOptFields {
    f: FieldOpts;

    init() {
        self.f = FieldOpts{ f1: null, f2: null, f3: null };
    }
}