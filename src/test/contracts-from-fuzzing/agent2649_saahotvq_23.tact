struct SOptional {
    si: Int?;
}

contract OptionalStructField {
    s: SOptional;

    init() {
        self.s = SOptional{
            si: null,
        };
    }
}