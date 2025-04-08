struct Data {
    a: Int;
    b: Bool;
}

contract OptionalVsNonOptional {
    fieldOpt: Data?;
    fieldPlain: Data;

    init() {
        self.fieldOpt = null;
        self.fieldPlain = Data{a:10,b:true};
    }
}
