struct DefaultsInside {
    foo: Int = 5;
    bar: Int = 10;
}

struct TopLevel {
    val: DefaultsInside?;
}

contract OptionalWithDefaults {
    s: TopLevel;

    init() {
        self.s = TopLevel{
            val: null
        };
    }
}
