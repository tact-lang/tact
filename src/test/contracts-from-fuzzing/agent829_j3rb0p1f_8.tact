struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract OptFields {
    data: ManyOptional;
    
    init() {
        self.data = ManyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: true,
        };
    }
}