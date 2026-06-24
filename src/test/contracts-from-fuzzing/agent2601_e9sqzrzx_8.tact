struct ManyOptional {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Int?;
    f5: String?;
    f6: Bool?;
}

contract OptionalFields {
    data: ManyOptional;
    init() {
        self.data = ManyOptional{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
            f6: null
        };
    }
}