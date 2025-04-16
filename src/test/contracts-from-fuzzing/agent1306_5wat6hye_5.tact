struct DefaultOptional {
    foo: Int? = null;
    bar: String = "hello";
}

contract OptionalDefaults {
    data: DefaultOptional;
    init() {
        self.data = DefaultOptional{
            // omit foo and bar, defaults should be used
        };
    }
}