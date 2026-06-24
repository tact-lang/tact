struct WeirdOpt {
    foo: Int? = 123;
    bar: String? = "xx";
}

contract NullOverrideDefaults {
    val: WeirdOpt;

    init() {
        self.val = WeirdOpt{
            foo: null,
            bar: null
        };
    }
}