struct InlineOptional {
    a: Int?;
}

contract OptionalInit {
    data: InlineOptional;
    
    init() {
        self.data = InlineOptional{
            a: 42
        };
    }
}