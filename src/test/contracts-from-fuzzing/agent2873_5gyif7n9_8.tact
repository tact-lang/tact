struct SOptional {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptFields {
    val: SOptional;
    init() {
        self.val = SOptional{ s: null, b: null, i: null };
    }
}