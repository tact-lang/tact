struct OneFieldOptional {
    val: Int?;
}

contract OptionalField {
    s: OneFieldOptional;

    init() {
        self.s = OneFieldOptional{ val: null };
    }
}