struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullDefaults {
    data: MultiOptional;
    
    init() {
        self.data = MultiOptional{
            a: null,
            b: null,
            c: null
        };
    }
}