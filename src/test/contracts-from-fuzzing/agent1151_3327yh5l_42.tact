struct AOpt {
    a: Int?;
}

contract DefaultsAreNull {
    field: AOpt;
    init() {
        self.field = AOpt{ a: null };
    }
}