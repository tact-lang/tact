struct AllOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
}

contract TestContract {
    optstruct: AllOptional;

    init() {
        self.optstruct = AllOptional {
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}