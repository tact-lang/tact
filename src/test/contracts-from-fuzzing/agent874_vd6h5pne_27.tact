contract EmptyDefaults {
    foo: Int;
    bar: String;

    init() {
        self.foo = 0;  // explicit default since Int needs init
        self.bar = ""; // explicit default for String
    }
}
