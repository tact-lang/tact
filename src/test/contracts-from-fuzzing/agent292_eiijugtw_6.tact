struct OneFieldOptional {
    val: Int?;
}

contract OptionalSingle {
    field: OneFieldOptional;

    init() {
        self.field = OneFieldOptional{ val: null };
    }
}