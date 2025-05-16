struct DefaultFields {
    a: Int = 42;
    b: Bool = true;
    c: String = "default";
    d: Int?;
    e: Bool?;
}

contract TestContract {
    dfields: DefaultFields;

    init() {
        self.dfields = DefaultFields{d: null, e: null};
    }
}