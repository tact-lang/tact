struct InnerOptional {
    val: Int?;
}

contract OptionalStructsWithDefaultNull {
    s: InnerOptional;

    init() {
        self.s = InnerOptional{ val: null };
    }
}