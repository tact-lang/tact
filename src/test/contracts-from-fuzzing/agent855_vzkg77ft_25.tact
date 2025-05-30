struct Mix {
    a: Int = 5;
    b: Bool;
    c: String?;
}

contract ComboDefaults {
    field: Mix;

    init() {
        self.field = Mix{
            // omit a, uses default 5
            b: true,
            c: null,
        };
    }

    receive() {}
}