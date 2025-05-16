struct DefaultValues {
    zero: Int = 0;
    one: Int = 1;
    str: String = "hello";
    flag: Bool = false;
    optInt: Int? = null;
    optStr: String? = null;
}

contract DefaultsContract {
    foo: DefaultValues;

    init() {
        self.foo = DefaultValues{};
    }
}