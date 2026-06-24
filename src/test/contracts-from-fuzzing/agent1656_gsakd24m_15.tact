struct DefaultsAndOptionals {
    foo: Int? = null;
    bar: String = "hello";
    baz: Bool?;
}

contract MixDefaultOptional {
    rec: DefaultsAndOptionals;

    init() {
        self.rec = DefaultsAndOptionals {};
    }
}