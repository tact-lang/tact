struct HasOptional {
    a: Int?;
    b: Bool?;
}

contract OptionalStruct {
    val: HasOptional;

    init() {
        self.val = HasOptional{ a: null, b: null };
    }
}