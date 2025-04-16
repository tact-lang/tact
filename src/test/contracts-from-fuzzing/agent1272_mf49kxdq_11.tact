struct SOptDefaults {
    foo: Int?;
    bar: Bool = false;
    baz: Int = 7;
    s: String = "hi";
}

contract OptDefaultsTest {
    data: SOptDefaults;

    init() {
        self.data = SOptDefaults{
            foo: null
        };
    }
}