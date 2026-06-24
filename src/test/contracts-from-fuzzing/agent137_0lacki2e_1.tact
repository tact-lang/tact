struct NestedOptional {
    value: Int?;
    flag: Bool?;
    text: String?;
}

contract TestNestedOptional {
    s: NestedOptional;
    
    init() {
        self.s = NestedOptional{
            value: null,
            flag: null,
            text: null,
        };
    }
}