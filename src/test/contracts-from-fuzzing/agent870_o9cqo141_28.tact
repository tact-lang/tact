struct HasLongStringDefaults {
    foo: String = "This is a very very very very very very very very long default string";
    bar: String = "Another super lengthy string with lots of characters just for testing purposes";
}

contract LongStringDefaults {
    data: HasLongStringDefaults;

    init() {
        self.data = HasLongStringDefaults{};
    }
}