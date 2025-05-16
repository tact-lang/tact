struct BigNestedOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
}

contract LargeOptionalStruct {
    data: BigNestedOptional;

    init() {
        self.data = BigNestedOptional{a: null, b: null, c: null, d: null, e: null};
    }

    receive() {
        self.data = self.data;
    }
}