contract OptionalStructField {
    data: Nested?;

    init() {
        self.data = null;
    }
}

struct Nested {
    name: String;
    flag: Bool;
}
