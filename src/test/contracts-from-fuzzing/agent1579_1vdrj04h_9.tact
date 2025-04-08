struct BigNestedOptional {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
    f: Bool?;
    g: Int?;
    h: Bool?;
    i: Int?;
}

contract OptionalNested {
    data: BigNestedOptional?;
    
    init() {
        self.data = null;
    }
}