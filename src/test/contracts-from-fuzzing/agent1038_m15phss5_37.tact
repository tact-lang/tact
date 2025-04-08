struct Top {
    inn: Int?;
    optbool: Bool?;
}

contract OptionalNoDefaults {
    data: Top;
    init() {
        self.data = Top{ inn: null, optbool: null };
    }
}